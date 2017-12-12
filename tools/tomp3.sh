#!/bin/sh

for f in $(ls . | grep ".mp4\|.webm"); do
  ffmpeg -i $f -vn -acodec mp3 "$f.mp3"
done
