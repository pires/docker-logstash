# Ubuntu 14.04.x + Oracle JRE 8
FROM dockerfile/java:oracle-java8

MAINTAINER pjpires@gmail.com

# Export Lumberjack
EXPOSE 5043

# Install runit
RUN echo "deb http://archive.ubuntu.com/ubuntu trusty main universe" > /etc/apt/sources.list && \
  apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y runit && \
  apt-get autoremove -y && \
  apt-get autoclean

# Install Logstash
RUN \
  cd / && \
  curl -O https://download.elasticsearch.org/logstash/logstash/logstash-1.4.2.tar.gz && \
  tar zxf logstash-1.4.2.tar.gz && \
  mv logstash-1.4.2 /logstash && \
  rm -f logstash-1.4.2.tar.gz

# Logstash config
ADD logstash.conf /logstash/conf/logstash.conf

# Certificates for logstash-forwarders
ADD certs/logstash-forwarder.crt /logstash/certs/logstash-forwarder.crt
ADD certs/logstash-forwarder.key /logstash/certs/logstash-forwarder.key

# runnable scripts
ADD run-logstash.sh /etc/service/logstash/run
RUN chmod u+x /etc/service/logstash/run

CMD ["/usr/bin/runsvdir", "-P", "/etc/service"]