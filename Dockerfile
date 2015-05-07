# docker build -t kalabox/debian:stable .

FROM debian:wheezy

RUN \
  apt-get update -y && \
  apt-get install -y unzip curl rsync git-core && \
  apt-get clean -y && \
  apt-get autoclean -y && \
  apt-get autoremove -y && \
  rm -rf /var/lib/{apt,dpkg,cache,log}/

