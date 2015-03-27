
# logstash
Logstash listening for Lumberjack protocol container made easy.

Here you will find a Dockerfile for assembling a Logstash container that listens over secure Lumberjack protocol. I made this so that I could [easily cluster ELK on top of Kubernetes](https://github.com/pires/kubernetes-elk-cluster).

## Pre-requisites

* Docker (test with boot2docker v1.5.0)
* Git (optional)

## Grab it

```
docker pull pires/docker-logstash
```

## Build images (optional)

Providing your own version of [the image automatically built for Logstash](https://registry.hub.docker.com/u/pires/docker-logstash) will not be supported. This is an *optional* step. You have been warned.

### Clone repository

```
git clone https://github.com/pires/docker-logstash.git
cd docker-logstash
```

### Assemble container

```
docker build -t pires/docker-logstash .
```

## SSL keys

[Since ```logstash-forwarder``` 0.4](http://www.elasticsearch.org/blog/logstash-forwarder-0-4-0-released/), you'll need to provide valid SSL certificates.
> * SSLv3 is no longer supported; TLS 1.0+ is required (compatible with Logstash 1.4.2+).
> * SSL certificates now require a matching hostname or IP SAN for the server.

Be sure to provide them in a Docker volume mounted at ```/certs```.
```
logstash-forwarder.crt
logstash-forwarder.key
```
