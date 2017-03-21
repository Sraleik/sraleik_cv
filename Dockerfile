FROM sraleik/x64-apache:xenial
MAINTAINER Sraleik <sraleik@gmail.com>

##### INSTALL NODE & NPM

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get --no-install-recommends -yq install \
        nodejs && \
    rm -rf /var/lib/apt/lists/*

RUN ln -s /usr/bin/nodejs /usr/local/bin/node
RUN curl -L https://npmjs.org/install.sh | sh

##### INSTALL COMPOSER

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php
RUN mv composer.phar /usr/local/bin/composer

##### COPY OF PROJECT

RUN rm -rf /app
COPY . /app/

##### INSTALL DEPENDENCY OF PROJECT

RUN php composer --no-interaction
RUN npm install

##### ADD Script that lauch apache

COPY run.sh /run.sh

##### ADD Test script of this docker

COPY blank_test.sh /test/blank_test.sh


EXPOSE 80

ENTRYPOINT ["bash"]

CMD ["-l", "/run.sh"]
