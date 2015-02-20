Kalabox nginx
===================

An nginx container meant to be run in tandem with php-fpm

```

# docker build -t kalabox/nginx .

FROM kalabox/debian:stable

# Install Nginx.
RUN \
  apt-get update && \
  apt-get install -y nginx dnsutils && apt-get clean

RUN chown -R root:root /var/lib/nginx

# The data container will manage these config files.
RUN rm /etc/nginx/nginx.conf
RUN ln -s /src/config/nginx/nginx.conf /etc/nginx/nginx.conf
RUN rm /etc/nginx/sites-enabled/default
RUN ln -s /src/config/nginx/site.conf /etc/nginx/sites-enabled/default

COPY start.sh /root/start.sh
RUN chmod 777 /root/start.sh

# Define default command.
CMD ["/root/start.sh"]

# Expose ports.
EXPOSE 80
EXPOSE 443


```