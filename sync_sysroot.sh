#!/bin/bash

SOURCE_ADDR=$1
DEST_ADDR=$2

echo "Synching $SOURCE_ADDR with $DEST_ADDR"

mkdir -p $DEST_ADDR/usr/local $DEST_ADDR/opt $DEST_ADDR/etc

rsync -avz $SOURCE_ADDR:/lib $DEST_ADDR
rsync -avz $SOURCE_ADDR:/usr/include $DEST_ADDR/usr
rsync -avz $SOURCE_ADDR:/usr/lib $DEST_ADDR/usr
rsync -avz $SOURCE_ADDR:/usr/local/include $DEST_ADDR/usr/local
rsync -avz $SOURCE_ADDR:/usr/local/lib $DEST_ADDR/usr/local
rsync -avz $SOURCE_ADDR:/opt/vc $DEST_ADDR/opt

echo "/lib/arm-linux-gnueabihf" 	>  $DEST_ADDR/etc/ld.so.conf
echo "/usr/lib/arm-linux-gnueabihf" 	>> $DEST_ADDR/etc/ld.so.conf
