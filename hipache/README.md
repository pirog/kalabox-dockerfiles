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
  apt-get install -y nodejs npm && \
  mkdir /srv/hipache && \
  curl -L https://github.com/kalabox/hipache/archive/0.3.1-kalabox.tar.gz > /tmp/hipache.tar.gz && \
  tar -xzvf /tmp/hipache.tar.gz --strip-components=1 -C /srv/hipache && \
  npm install -g /srv/hipache --production && \
  mkdir -p /var/log/hipache

ENV NODE_ENV production

EXPOSE 80
EXPOSE 443

CMD [ "/usr/bin/hipache", "-c", "/etc/hipache/config.json" ]

```

