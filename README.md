
# docker-logstash
Lean (315MB) and highly configurable Logstash Docker image, based on `gliderlabs/alpine`.

[![Docker Repository on Quay.io](https://quay.io/repository/pires/docker-logstash/status "Docker Repository on Quay.io")](https://quay.io/repository/pires/docker-logstash)

I made this so that I could [easily cluster ELK on top of Kubernetes](https://github.com/pires/kubernetes-elk-cluster), and so, by default it will be listening for the [lumberjack](http://logstash.net/docs/1.4.2/inputs/lumberjack) protocol with certificates provisioned in a mounted directory, `/logstash/certs`.

## Current software

* Oracle JRE 8 Update 60
* Logstash 1.5.4

## Pre-requisites

* Docker 1.7.0+

## Run

Assuming:
* `/logstash/config` - where `logstash` will look for `logstash.conf` file
* `/logstash/certs` - where `logstash` will look for certificate files to be used with `lumberjack`

Run:

```
docker run --name logstash \
	--detach \
	-p 5043:5043 \
	--volume /home/pires/logstash:/logstash/config \
	quay.io/pires/docker-logstash:1.5.4-2
```

or 

```
docker run --name logstash \
	--detach \
	-p 5043:5043 \
	--volume /home/pires/logstash:/logstash/config \
	--volume /home/pires/logstash-certs:/logstash/certs \
	quay.io/pires/docker-logstash:1.5.4-2
```

## SSL keys

[Since ```logstash-forwarder``` 0.4](http://www.elasticsearch.org/blog/logstash-forwarder-0-4-0-released/), you'll need to provide valid SSL certificates.
> * SSLv3 is no longer supported; TLS 1.0+ is required (compatible with Logstash 1.4.2+).
> * SSL certificates now require a matching hostname or IP SAN for the server.
