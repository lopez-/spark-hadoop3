# spark-hadoop3

Spark 2.4.5 with Hadoop 3.2.1 and Delta 0.6.0

## Download spark without hadoop and build base images
```
./spark.sh
```

## Build image with Hadoop
```
docker build -t spark-with-hadoop3
```

## Run sample app
```
docker run --rm -it spark-with-hadoop3 ../bin/spark-submit main.py
```