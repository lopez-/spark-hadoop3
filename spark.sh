#!/usr/bin/env bash

curl http://archive.apache.org/dist/spark/spark-2.4.5/spark-2.4.5-bin-without-hadoop.tgz -o spark-2.4.5-bin-without-hadoop.tgz
tar -xvzf spark-2.4.5-bin-without-hadoop.tgz && rm spark-2.4.5-bin-without-hadoop.tgz
cd spark-2.4.5-bin-without-hadoop
bin/docker-image-tool.sh build
