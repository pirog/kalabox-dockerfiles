Kalabox MariaDB
===================

A MariaDB container with a kalabox database

```

# docker build -t kalabox/mariadb:stable .

FROM kalabox/debian:stable

# Install MariaDB.
RUN \
  apt-get install -y python-software-properties && \
  apt-key adv --recv-keys --keyserver keyserver.ubuntu.com --recv 0xcbcb082a1bb943db && \
  add-apt-repository 'deb http://sfo1.mirrors.digitalocean.com/mariadb/repo/10.0/debian wheezy main' && \
  apt-get update -y && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y mariadb-server && \
  apt-get clean -y && \
  apt-get autoclean -y && \
  apt-get autoremove -y && \
  rm -rf /var/lib/{apt,dpkg,cache,log}/

# The data container will manage these config files.
# @todo: we can't do this on Windows yet because VBOX sharing sets all
# files to 777 and mysql wont load a world writable conf file
#RUN rm /etc/mysql/my.cnf
#RUN ln -s /src/config/mysql/my.cnf /etc/mysql/my.cnf
# Windows sometimes causes this to become world-writable
#RUN chmod 644 /src/config/mysql/my.cnf

RUN rm /etc/mysql/my.cnf
COPY my.cnf /etc/mysql/my.cnf
COPY start.sh /start.sh
RUN chmod +x /start.sh

#RUN rm -Rf /var/lib/mysql
#RUN mysql_install_db --user=root --ldata=/sql

# Define default command.
CMD ["/start.sh"]

# Expose ports.
EXPOSE 3306

```

