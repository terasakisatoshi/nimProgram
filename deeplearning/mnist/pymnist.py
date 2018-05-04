import chainer
import chainer.functions as F
import chainer.links as L
from chainer import training, datasets, iterators, optimizers
from chainer.training import extensions
import numpy as np

DEVICE = -1
BATCH_SIZE = 32


class MNISTCONV(chainer.Chain):

    def __init__(self):
        super(MNISTCONV, self).__init__()
        with self.init_scope():
            ksize = 5
            self.cv1 = L.Convolution2D(1, 20, ksize=ksize)
            linear_size1 = (28 - (ksize - 1)) // 2
            self.cv2 = L.Convolution2D(20, 50, ksize=ksize)
            linear_size2 = (linear_size1 - (ksize - 1)) // 2
            self.hidden = L.Linear(linear_size2 * linear_size2 * 50, 500)
            self.classifier = L.Linear(500, 10)

    def __call__(self, x):
        h = self.cv1(x)
        h = F.relu(h)
        h = F.max_pooling_2d(h, 2)
        h = self.cv2(h)
        h = F.relu(h)
        h = F.max_pooling_2d(h, 2)
        h = self.hidden(h)
        h = F.relu(h)
        h = self.classifier(h)
        return h


def train():
    model = L.Classifier(MNISTCONV())
    if DEVICE >= 0:
        chainer.cuda.get_device_from_id(DEVICE).use()
        chainer.cuda.check_cuda_available()
        model.to_gpu()
    train, test = chainer.datasets.get_mnist(ndim=3)
    train_iter = iterators.SerialIterator(train, BATCH_SIZE, shuffle=True)
    test_iter = iterators.SerialIterator(test, 1, repeat=False, shuffle=False)

    optimizer = optimizers.SGD(lr=0.01)
    optimizer.setup(model)

    updater = training.StandardUpdater(train_iter, optimizer, device=DEVICE)
    trainer = training.Trainer(updater, (5, 'epoch'), out='result')

    log_interval = (100, 'iteration')
    trainer.extend(extensions.Evaluator(test_iter, model, device=DEVICE))
    trainer.extend(extensions.LogReport(trigger=log_interval))
    trainer.extend(extensions.PrintReport([
        'iteration', 'main/loss', 'validation/main/loss',
        'main/accuracy', 'validation/main/accuracy', 'elapsed_time'
    ]), trigger=log_interval)
    trainer.extend(extensions.ProgressBar())

    with chainer.using_config('train', True):
        trainer.run()

    chainer.serializers.save_npz('result/mnistconv.npz', model)


def predict():
    model = L.Classifier(MNISTCONV())
    chainer.serializers.load_npz('result/mnistconv.npz', model)
    train, test = chainer.datasets.get_mnist(ndim=3)
    counter = 0
    acc = 0
    for t in test:
        counter += 1
        x, ans = t
        with chainer.using_config('train', False), chainer.using_config('enable_backprop', False):
            result = model.predictor(np.array([x])).data[0]
        if ans == np.argmax(result):
            acc += 1
    print(acc / counter)


def main():
    train()
    predict()


if __name__ == '__main__':
    main()
