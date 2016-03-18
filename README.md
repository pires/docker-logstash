
# docker-logstash
Lean (254MB) and highly configurable Logstash Docker image, based on `alpine:edge` and OpenJDK.

[![Docker Repository on Quay.io](https://quay.io/repository/pires/docker-logstash/status "Docker Repository on Quay.io")](https://quay.io/repository/pires/docker-logstash)

## Current software

* [OpenJDK 8u72](http://openjdk.java.net/projects/jdk8u/releases/8u72.html)
* Logstash 2.2.2

## Run

Assuming:
* `/logstash/config` - where `logstash` will look for `logstash.conf` file
* `/logstash/certs` - where `logstash` will look for certificate files

Run:

```
docker run --name logstash \
	--detach \
	--volume /home/pires/logstash:/logstash/config \
	quay.io/pires/docker-logstash:2.2.2
```

or 

```
docker run --name logstash \
	--detach \
	--volume /home/pires/logstash:/logstash/config \
	--volume /home/pires/logstash-certs:/logstash/certs \
	quay.io/pires/docker-logstash:2.2.2
```
