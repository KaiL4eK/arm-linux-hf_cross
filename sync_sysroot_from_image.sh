#!/bin/bash

image=$1

source_dir=mnt
dest_dir=$2

if [ -z $1  ]; then
	echo "Image is not set"
	exit
fi

if [ -z $2  ]; then
        echo "Dest directory is not set"
        exit
fi

if [ -d $source_dir ]; then
	echo "Mount directory already exist"
	exit
fi

mkdir $source_dir

sudo mount $image $source_dir

echo "Synching $image with $dest_dir"

mkdir -p $dest_dir/usr/local $dest_dir/opt $dest_dir/etc

rsync -avz $source_dir/lib $dest_dir
rsync -avz $source_dir/usr/include $dest_dir/usr
rsync -avz $source_dir/usr/lib $dest_dir/usr
rsync -avz $source_dir/usr/local/include $dest_dir/usr/local
rsync -avz $source_dir/usr/local/lib $dest_dir/usr/local
rsync -avz $source_dir/opt/vc $dest_dir/opt

echo "/lib/arm-linux-gnueabihf" 	>  $dest_dir/etc/ld.so.conf
echo "/usr/lib/arm-linux-gnueabihf" 	>> $dest_dir/etc/ld.so.conf

sudo umount $source_dir
rmdir $source_dir
