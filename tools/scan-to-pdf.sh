#!/bin/sh

# scan images

# low resolution gray scale
scanimage --format jpeg --resolution 300  --output img1.jpg
scanimage --format jpeg --resolution 300  --output img2.jpg

# colorful higher resolution
scanimage --format jpeg --resolution 600 --mode Color --output img3.jpg

# convert to pdf using imagemagick
convert img*.jpg img.pdf
