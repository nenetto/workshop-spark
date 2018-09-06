#!/bin/bash
PROJECT_VERSION=0.1.0-SNAPSHOT
#base
docker build -t ubuntu-base base/base/

#spark
docker build -t flyday-spark base/spark/

echo "+++++++++++++++++++++++++++++++++++++++++++++"
echo "all images were build succesfully!     "
echo "+++++++++++++++++++++++++++++++++++++++++++++"
exit 0
