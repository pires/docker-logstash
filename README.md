
# docker-logstash
Lean (255MB) and highly configurable Logstash Docker image, based on `alpine:edge` and OpenJDK.

[![Docker Repository on Quay.io](https://quay.io/repository/pires/docker-logstash/status "Docker Repository on Quay.io")](https://quay.io/repository/pires/docker-logstash)

## Current software

* [OpenJDK 8u112](http://openjdk.java.net/projects/jdk8u/releases/8u112.html)
* Logstash 5.1.2

## Run

Assuming:
* `/logstash/config` - where `logstash` will look for `logstash.conf` file
* `/logstash/certs` - where `logstash` will look for certificate files

Run:

```
docker run --name logstash \
	--detach \
	--volume /home/pires/logstash:/logstash/config \
	quay.io/pires/docker-logstash:5.1.2
```

or 

```
docker run --name logstash \
	--detach \
	--volume /home/pires/logstash:/logstash/config \
	--volume /home/pires/logstash-certs:/logstash/certs \
	quay.io/pires/docker-logstash:5.1.2
```
