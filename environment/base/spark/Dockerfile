FROM ubuntu-base

ENV HADOOP_VERSION=2.7.5
RUN mkdir /opt/sds

# Download Hadoop and install it in /opt/sds/hadoop
RUN wget https://archive.apache.org/dist/hadoop/core/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}.tar.gz -O /opt/hadoop-${HADOOP_VERSION}.tar.gz
RUN cd /opt/ && tar xf hadoop-${HADOOP_VERSION}.tar.gz
RUN ln -s /opt/hadoop-${HADOOP_VERSION} /opt/sds/hadoop

ENV HADOOP_HOME /opt/sds/hadoop

# Including Hadoop environment and HDFS commands into bash
ENV HADOOP_CONF_DIR /opt/sds/hadoop/etc/hadoop

ENV PATH $PATH:$HADOOP_HOME/bin

# SET Java environment (needed to run hadoop)
RUN sed -i '/export JAVA_HOME=\${JAVA_HOME}/c export JAVA_HOME=/usr/lib/jvm/java-8-oracle' ${HADOOP_CONF_DIR}/hadoop-env.sh

# format namenode
RUN /opt/sds/hadoop/bin/hdfs namenode -format

# SPARK environment and download
ENV SPARK_VERSION 2.3.1
ENV SPARK_PACKAGE spark-${SPARK_VERSION}-bin-without-hadoop
ENV SPARK_HOME /opt/sds/spark-${SPARK_VERSION}
ENV SPARK_DIST_CLASSPATH="$HADOOP_HOME/etc/hadoop/*:$HADOOP_HOME/share/hadoop/common/lib/*:$HADOOP_HOME/share/hadoop/common/*:$HADOOP_HOME/share/hadoop/hdfs/*:$HADOOP_HOME/share/hadoop/hdfs/lib/*:$HADOOP_HOME/share/hadoop/hdfs/*:$HADOOP_HOME/share/hadoop/yarn/lib/*:$HADOOP_HOME/share/hadoop/yarn/*:$HADOOP_HOME/share/hadoop/mapreduce/lib/*:$HADOOP_HOME/share/hadoop/mapreduce/*:$HADOOP_HOME/share/hadoop/tools/lib/*"
ENV PATH $PATH:${SPARK_HOME}/bin

#Installing SPARK
RUN curl -sL --retry 3 \
  "https://archive.apache.org/dist/spark/spark-${SPARK_VERSION}/${SPARK_PACKAGE}.tgz" \
  | gunzip \
  | tar x -C /opt/sds/ \
 && mv /opt/sds/$SPARK_PACKAGE $SPARK_HOME \
 && chown -R root:root $SPARK_HOME

# Add conf files
ADD conf /conf
ADD data /opt/sds/spark-2.3.1/examples/data

#Starting SPARK
WORKDIR $SPARK_HOME
CMD ["bin/spark-class", "org.apache.spark.deploy.master.Master"]
