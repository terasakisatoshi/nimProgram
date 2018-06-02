FROM nvidia/cuda:8.0-cudnn7-devel-ubuntu16.04

MAINTAINER SatoshiTerasaki <terasakisatoshi@gmail.com>

RUN apt-get update
RUN apt-get install build-essential -y

RUN apt-get install git wget -y

RUN apt-get install libatlas-base-dev -y
RUN apt-get install libatlas-doc -y
RUN apt-get install libopenblas-base -y
RUN apt-get install libopenblas-dev -y

RUN wget https://nim-lang.org/download/nim-0.18.0.tar.xz
RUN tar -Jxvf nim-0.18.0.tar.xz 
WORKDIR /nim-0.18.0
RUN sh build.sh
RUN sh install.sh /usr/local/bin

RUN nim c koch.nim && ./koch
RUN ./koch nimble
RUN mv bin/nimble /usr/local/bin

WORKDIR /
RUN git clone https://github.com/mratsim/Arraymancer.git

WORKDIR /Arraymancer
RUN nimble install -y

WORKDIR /
ADD get-mnist.sh .
RUN sh get-mnist.sh
COPY mnist.nim .

RUN nim c -d:release mnist.nim