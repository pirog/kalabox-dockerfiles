Kalabox Hipache
===================

Hipache rebased on kalabox/debian

```

# Hipache rebased on kalabox/debian
# docker build -t kalabox/hipache .
# docker run -d -p 80:80 -p 6379:6379 --name kalabox_hipache kalabox/hipache

FROM kalabox/debian

ENV DEBIAN_FRONTEND noninteractive

RUN \
  apt-get update -y && \
  curl -sL https://deb.nodesource.com/setup | bash - && \
  apt-get install -y supervisor nodejs npm redis-server && \
  mkdir ./hipache && \
  curl -L https://github.com/kalabox/hipache/archive/0.3.1.tar.gz > /tmp/hipache.tar.gz && \
  tar -xzvf /tmp/hipache.tar.gz --strip-components=1 -C ./hipache && \
  npm install --prefix=/usr/local -g ./hipache --production && \
  mkdir -p /var/log/hipache && \
  rm -rf /tmp/*

COPY ./config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY ./config/redis.conf /src/redis/redis.conf
COPY ./config/hipache.conf /src/hipache/config.json

ENV NODE_ENV production

EXPOSE 80
EXPOSE 8160

CMD ["supervisord", "-n"]

```
