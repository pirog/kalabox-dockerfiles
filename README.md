Kalabox Dockerfiles
===================

This contains all the dockerfiles we are using for our core containers. These are all also published to the docker registry. Readmes for each are available in their directories as needed.

Please feel free to use them for your other things.

## Kalabox Debian

The base of almost all the other images.

```

# docker build -t kalabox/debian .

FROM debian:wheezy

RUN \
  apt-get update -y && \
  apt-get install -y unzip curl

```

