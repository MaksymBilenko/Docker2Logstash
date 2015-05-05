FROM ruby:latest

MAINTAINER Maksym Bilenko "sath891@gmail.com"

ENV DOCKER_HOST unix:///var/run/docker.sock
ENV LOGSTASH_URL tcp://logstash:9290

COPY main.rb /app/DockerLogstash/main.rb
COPY Gemfile /app/DockerLogstash/Gemfile

WORKDIR /app/DockerLogstash
RUN bundle install

CMD ruby main.rb