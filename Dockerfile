# docker build -t kalabox/debian:stable .

FROM debian:wheezy

RUN \
  apt-get update -y && \
  apt-get install -y unzip curl rsync git-core nano && \
  apt-get -y clean && \
  apt-get -y autoclean && \
  apt-get -y autoremove && \
  rm -rf /var/lib/apt/* && rm -rf /var/lib/cache/* && rm -rf /var/lib/log/* && rm -rf /tmp/*


