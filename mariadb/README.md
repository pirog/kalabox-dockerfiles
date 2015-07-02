Kalabox MariaDB
===================

A MariaDB container with a kalabox database

```

# docker build -t kalabox/mariadb:stable .

FROM kalabox/debian:stable

# Install MariaDB.
RUN \
  apt-get update -y && \
  apt-get install -y python-software-properties && \
  apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 0xcbcb082a1bb943db && \
  add-apt-repository 'deb http://mirrors.accretive-networks.net/mariadb/repo/5.5/debian wheezy main' && \
  apt-get update -y && \
  apt-get install -y mariadb-server && \
  apt-get clean -y && \
  apt-get autoclean -y && \
  apt-get autoremove -y && \
  rm -rf /var/lib/apt/* && rm -rf && rm -rf /var/lib/cache/* && rm -rf /var/lib/log/* && rm -rf /tmp/*

RUN rm /etc/mysql/my.cnf
COPY my.cnf /etc/mysql/my.cnf
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Define default command.
CMD ["/start.sh"]

# Expose ports.
EXPOSE 3306

```
