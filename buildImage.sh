#!/bin/bash
if [ -z "$1" ]
  then
    echo "No branch supplied, should perform like : $0 0.1"
    exit 1
fi
branch=$1
rm -rf target
mkdir -p target/data
tar -zxvf data/docker/docker-1.11.2.tgz -C target/data/

imageName=yren/kiwi-jenkins

echo
echo "**********************************************************************"
echo "* docker build $imageName:$1 "
echo "**********************************************************************"
echo
docker build --rm -t $imageName:$1 .
#docker build $dockerBuildArg --rm -t $dockerrepo/$imageName:$1 .

echo
echo "**********************************************************************"
echo "* docker push $imageName:$1 "
echo "**********************************************************************"
echo
#docker push $imageName:$1
