FROM progrium/busybox
MAINTAINER pjpires@gmail.com

# Export Lumberjack
EXPOSE 5043

ENV LOGSTASH_PKG_NAME logstash-1.5.0.rc2

# Add bash cause Logstash needs it & Update wget to support SSL
RUN opkg-install bash wget

# Get and install JRE 8 Updated 40
RUN \
  wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" -O /tmp/jre.tar.gz http://download.oracle.com/otn-pub/java/jdk/8u40-b26/jre-8u40-linux-x64.tar.gz && \
  cd /opt && \
  gunzip /tmp/jre.tar.gz && \
  tar xf /tmp/jre.tar && \
  rm -f /tmp/jre.tar

# Link Java into use, wget-ssl updates libpthread which causes Java to break
RUN ln -sf /lib/libpthread-2.18.so /lib/libpthread.so.0
RUN ln -s /opt/jre1.8.0_40/bin/java /usr/bin/java

# Install Logstash
RUN \
  cd / && \
  wget --no-check-certificate --no-cookies https://download.elasticsearch.org/logstash/logstash/$LOGSTASH_PKG_NAME.tar.gz && \
  gunzip $LOGSTASH_PKG_NAME.tar.gz && \
  tar xf $LOGSTASH_PKG_NAME.tar && \
  mv $LOGSTASH_PKG_NAME /logstash && \
  rm -f $LOGSTASH_PKG_NAME.tar && \
  rm -rf $(find /logstash | egrep "(\.(exe|bat)$|sigar/.*(dll|winnt|x86-linux|solaris|ia64|freebsd|macosx))")

# Logstash config
ADD logstash.conf /logstash/conf/logstash.conf

# Certificates for logstash-forwarders
VOLUME ["/certs"]

CMD ["/logstash/bin/logstash", "--quiet",  "-f", "/logstash/conf/logstash.conf"]
