FROM spark-py-without-hadoop

# hadoop
ENV HADOOP_VERSION 3.2.1
ENV HADOOP_HOME /opt/hadoop
ENV HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop
ENV PATH $PATH:$HADOOP_HOME/bin

RUN cd /opt \
    && curl https://apache.mirror.globo.tech/hadoop/common/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}.tar.gz -o hadoop.tar.gz \
    && tar -xvzf hadoop.tar.gz \
    && mv hadoop-${HADOOP_VERSION} hadoop \
    && rm -rf $HADOOP_HOME/share/doc \
    && rm hadoop.tar.gz

# spark
ENV PYTHONPATH $SPARK_HOME/python:$SPARK_HOME/python/lib/py4j-0.10.7-src.zip:$PYTHONPATH
COPY spark-env.sh $SPARK_HOME/conf-org/spark-env.sh
RUN sed -i '30i #CUSTOM\n' /opt/entrypoint.sh \
    && sed -i '/#CUSTOM/a source ${SPARK_HOME}/conf-org/spark-env.sh\n' /opt/entrypoint.sh

# delta
ENV DELTA_VERSION 0.6.0
ADD https://repo1.maven.org/maven2/io/delta/delta-core_2.11/${DELTA_VERSION}/delta-core_2.11-${DELTA_VERSION}.jar $SPARK_HOME/jars
