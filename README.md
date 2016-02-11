
# docker-logstash
Lean (311MB) and highly configurable Logstash Docker image, based on `gliderlabs/alpine`.

[![Docker Repository on Quay.io](https://quay.io/repository/pires/docker-logstash/status "Docker Repository on Quay.io")](https://quay.io/repository/pires/docker-logstash)

## Current software

* Oracle JRE 8 Update 74
* Logstash 2.2.0

## Run

Assuming:
* `/logstash/config` - where `logstash` will look for `logstash.conf` file
* `/logstash/certs` - where `logstash` will look for certificate files

Run:

```
docker run --name logstash \
	--detach \
	--volume /home/pires/logstash:/logstash/config \
	quay.io/pires/docker-logstash:2.2.0
```

or 

```
docker run --name logstash \
	--detach \
	--volume /home/pires/logstash:/logstash/config \
	--volume /home/pires/logstash-certs:/logstash/certs \
	quay.io/pires/docker-logstash:2.2.0
```
