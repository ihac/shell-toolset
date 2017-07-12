#! /bin/bash

list=`docker images | tail -n +2`
IFS=$'\n'
for line in $list; do
    line=`echo $line | tr -s ' '`
    imageName=`echo $line | cut -d ' ' -f1`
    imageVersion=`echo $line | cut -d ' ' -f2`
    imageId=`echo $line | cut -d ' ' -f3`
    shortName=${imageName##*/}
    read -p "save $shortName? y/n: " cmd
    if [[ $cmd == "y" ]]; then
        [[ -f $shortName.tar ]] && echo "$shortName.tar already exists" || eval "echo '' && docker save $imageId > $shortName.tar" 
    fi
done
