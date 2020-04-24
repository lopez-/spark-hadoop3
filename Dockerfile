FROM spark-py

# hadoop
ENV HADOOP_VERSION 3.2.1
ENV HADOOP_HOME /opt/hadoop
ENV HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop
ENV PATH $PATH:$HADOOP_HOME/bin

RUN apt-get install -y curl

RUN cd /opt \
    && curl https://apache.mirror.globo.tech/hadoop/common/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}.tar.gz -o hadoop.tar.gz \
    && tar -xvzf hadoop.tar.gz \
    && rm -rf $HADOOP_HOME/share/doc \
    && rm hadoop.tar.gz

# spark-env.sh
COPY spark-env.sh $SPARK_HOME/conf-org/spark-env.sh
RUN sed -i '30i #CUSTOM\n' /opt/entrypoint.sh \
    && sed -i '/#CUSTOM/a source ${SPARK_HOME}/conf-org/spark-env.sh\n' /opt/entrypoint.sh