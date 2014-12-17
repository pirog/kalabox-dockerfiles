Kalabox Dockerfiles
===================

This contains all the dockerfiles we are using for our core containers. These are all also published to the docker registry.

Please feel free to use them for your other things.

Here is a breakdown of some of the containers you can build from here:

## Debian

The base of almost all the other images.

```
# docker build -t kalabox/debian .

FROM debian:wheezy

RUN apt-get update -y
RUN apt-get install -y unzip curl
```

## Hipache

## Skydns

## Skydock

## Dnsmasq

Dnsmasq for DHCP and DNS things~

```
# Dnsmasq image for wildcard support *.kbox
# docker build -t kalabox/dnsmasq .
# docker run -d -p 1.3.3.7:53:53/udp --name dnsmasq kalabox/dnsmasq
# @todo: need to get 1.3.3.7 to be set dynamically. Maybe env passed in run?

FROM kalabox/debian

RUN apt-get install -y dnsmasq && apt-get clean

RUN echo 'user=root' >> /etc/dnsmasq.conf
RUN echo 'address=/.kbox/1.3.3.7' >> /etc/dnsmasq.conf

EXPOSE 53

CMD ["/usr/sbin/dnsmasq", "-d"]
```

## Data

Data container also containing some plugins for skydock

```
# docker build -t kalabox/data .

FROM busybox

COPY data /data

VOLUME ["/data"]

CMD ["/bin/true"]
```
