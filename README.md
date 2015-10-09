Kalabox Dockerfiles
===================

This contains all the dockerfiles we are using for our core containers. These are all also published to the docker registry. Readmes for each are available in their directories as needed.

Please feel free to use them for your other things.

## Kalabox Debian

The base of almost all the other images.

```

# docker build -t kalabox/debian:stable .

FROM debian:wheezy

RUN \
  apt-get update -y && \
  apt-get install -y unzip curl rsync git-core && \
  apt-get -y clean && \
  apt-get -y autoclean && \
  apt-get -y autoremove && \
  rm -rf /var/lib/apt/* && rm -rf && rm -rf /var/lib/cache/* && rm -rf /var/lib/log/* && rm -rf /tmp/*

```

