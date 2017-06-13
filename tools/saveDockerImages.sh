#! /bin/bash

docker images | tail -n +2 |\
while read line
do
    imageName=`echo $line | cut -d ' ' -f 1`
    imageVersion=`echo $line | cut -d ' ' -f 2`
    imageId=`echo $line | cut -d ' ' -f 3`
    shortName=${imageName##*/}
    echo $shortName
    docker save $imageId > $shortName.tar
done
