import arraymancer

var origimage=read_image("nim.png")
echo origimage.shape # [4, 900, 1187]
origimage.write_png("output_from_nim.png")