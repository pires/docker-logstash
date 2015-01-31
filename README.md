
# logstash
Logstash listening for Lumberjack protocol container made easy.

Here you will find a Dockerfile for assembling a Logstash container that listens over secure Lumberjack protocol. I made this so that I could [easily cluster ELK on top of Kubernetes](https://github.com/pires/kubernetes-elk-cluster).

## Pre-requisites

* Docker (test with boot2docker v1.4.1)
* Git (optional)

## Grab it

```
docker pull pires/logstash
```

## Build images (optional)

Providing your own version of [the image automatically built for Logstash](https://registry.hub.docker.com/u/pires/logstash) will not be supported. This is an *optional* step. You have been warned.

### Clone repository

```
git clone https://github.com/pires/kubernetes-elasticsearch-cluster.git
cd kubernetes-elasticsearch-cluster
```

### Assemble container

```
docker build -t pires/logstash:latest .
```
