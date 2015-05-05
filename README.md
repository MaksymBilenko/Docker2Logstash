Docker2Logstash
===============

Image that redirects stdout and stderr from Docker containers to the [Logstash](http://logstash.net/)

This **Dockerfile** is a [trusted build](https://registry.hub.docker.com/u/sath89/docker2logstash/) of [Docker Registry](https://registry.hub.docker.com/).

### Installation

    docker pull sath89/docker2logstash

### Run with [docker-compose.yml](https://github.com/MaksymBilenko/Docker2Logstash/blob/master/docker-compose.yml)

    curl https://raw.githubusercontent.com/MaksymBilenko/Docker2Logstash/master/docker-compose.yml \
    -o docker-compose.yml
    docker-compose up

### Run with docker.sock and link with [logstash](https://registry.hub.docker.com/u/sath89/logstash/) container:

    docker run -itd -v /var/run/docker.sock:/var/run/docker.sock \
    --name docker2logstash --link logstash:logstash \
    sath89/docker2logstash

### Run with custom Docker API URL and Logstash TCP URL:

    docker run -itd -e DOCKER_HOST=tcp://192.168.59.103:2376 \
    -e DOCKER_CERT_PATH=/root/.docker \
    -e LOGSTASH_URL=tcp://192.168.59.103:9290 \
    -v ${HOME}/.docker:/root/.docker \
    sath89/docker2logstash

Port 9290 is the configured port at logstash that listen tcp with driver: json:

    input {tcp { port => 9290 tags => "tcpin" codec => "json" } }
