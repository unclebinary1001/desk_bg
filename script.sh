#!/bin/bash

# TODO - get image from unsplash
# dowload to tmp file
# using hardcoded url for now
img_url="https://images.unsplash.com/photo-1535320404287-416e2c6d2b41?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8M3x8fGVufDB8fHx8fA%3D%3D"

bg_img_path=/tmp/deskbg_img
img_name=img.png

mkdir $bg_img_path

wget $img_url -O $bg_img_path/$img_name


# Get all "last-image" properties
image_paths=$(xfconf-query -c xfce4-desktop -l | grep 'last-image$')

for path in $image_paths; do
    xfconf-query -c xfce4-desktop -p "$path" -s "$bg_img_path/$img_name"
done

sleep 6

rm -rf $bg_img_path
echo "finished running"