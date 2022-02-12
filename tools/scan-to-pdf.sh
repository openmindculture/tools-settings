#!/bin/sh

# scan images
scanimage --format jpeg --resolution 300  --output img1.jpg
scanimage --format jpeg --resolution 300  --output img2.jpg

# convert to pdf using imagemagick
convert img*.jpg img.pdf
