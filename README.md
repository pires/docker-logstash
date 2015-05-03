
# logstash
Lean (314MB) and highly configurable Logstash Docker image, based on `progrium/busybox`.

## Current software

* Oracle JRE 8 Update 45
* Logstash 1.5.0 RC3

## Pre-requisites

* Docker 1.5.0+ (tested with boot2docker)

## Build images (optional)

Providing your own version of [the image automatically built for Logstash](https://registry.hub.docker.com/u/pires/docker-logstash) will not be supported. This is an *optional* step. You have been warned.

```
git clone https://github.com/pires/docker-logstash.git
cd docker-logstash
docker build -t pires/docker-logstash .
```

## Run

You need a folder named `config` with your own version of `logstash.conf` mounted as `/logstash/config`.

I made this so that I could [easily cluster ELK on top of Kubernetes](https://github.com/pires/kubernetes-elk-cluster), and so, by default it will be listening for the Lumberjack protocol with certificates provisioned in a mounted directory, `/logstash/certs`.

```
docker run --rm -v conf:/logstash/config pires/docker-logstash
```

## SSL keys

[Since ```logstash-forwarder``` 0.4](http://www.elasticsearch.org/blog/logstash-forwarder-0-4-0-released/), you'll need to provide valid SSL certificates.
> * SSLv3 is no longer supported; TLS 1.0+ is required (compatible with Logstash 1.4.2+).
> * SSL certificates now require a matching hostname or IP SAN for the server.

Be sure to provide them in a Docker volume mounted at ```/logstash/certs```.
```
logstash-forwarder.crt
logstash-forwarder.key
```
