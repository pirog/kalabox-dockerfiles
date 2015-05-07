# docker build -t kalabox/debian:stable .

FROM debian:wheezy

RUN \
  apt-get update -y && \
  apt-get install -y unzip curl rsync git-core

