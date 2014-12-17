# docker build -t kalabox/debian .

FROM debian:wheezy

RUN \
  apt-get update -y && \
  apt-get install -y unzip curl

