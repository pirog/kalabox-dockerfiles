# docker build -t kalabox/drush .

FROM kalabox/debian:stable

# Install Drush & dependencies
RUN \
  apt-get install -y mysql-client php5-cli php5-dev php5-gd php5-mcrypt php5-mysqlnd sqlite git-core && apt-get clean


# Install Composer
RUN \
  curl -sS https://getcomposer.org/installer | php && \
  mv composer.phar /usr/local/bin/composer && \
  ln -s /usr/local/bin/composer /usr/bin/composer

# Install some drushes
RUN \
  git clone --depth 1 --branch 6.5.0 https://github.com/drush-ops/drush.git /usr/local/src/drush6 && \
  git clone --depth 1 --branch 7.0.0-alpha8 https://github.com/drush-ops/drush.git /usr/local/src/drush7 && \
  ln -s /usr/local/src/drush6/drush /usr/bin/drush6 && \
  ln -s /usr/local/src/drush7/drush /usr/bin/drush7 && \
  cd /usr/local/src/drush7 && composer install

# Set up our kalabox specific stuff
COPY kdrush /usr/local/bin/kdrush
COPY ssh-config /root/.ssh/config
RUN \
  chmod +x /usr/local/bin/kdrush && \
  mkdir -p /root/.ssh && \
  ln -s /src/config/drush /root/.drush

WORKDIR /data
ENTRYPOINT ["/usr/local/bin/kdrush"]
