#!/bin/bash
PROJECT_VERSION=0.1.0-SNAPSHOT

echo "+++++++++++++++++++++++++++++++++++++++++++++"
echo "Building images     "
echo "+++++++++++++++++++++++++++++++++++++++++++++"


#base
docker build -t ubuntu-base base/base/

#spark
docker build -t nenetto/workshop-spark-master base/spark/

echo "+++++++++++++++++++++++++++++++++++++++++++++"
echo "all images were build succesfully!     "
echo "+++++++++++++++++++++++++++++++++++++++++++++"

echo "+++++++++++++++++++++++++++++++++++++++++++++"
echo "Pushing images    "
echo "+++++++++++++++++++++++++++++++++++++++++++++"

docker push nenetto/workshop-spark-master


exit 0
