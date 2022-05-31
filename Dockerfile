FROM php:8.1-alpine

LABEL maintainer="David Zapata <jdavid.zapatab@gmail.com>"

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN chmod +x /usr/local/bin/install-php-extensions \
    && mkdir -p /var/www \
    && install-php-extensions xdebug \
    && install-php-extensions gd \
    && install-php-extensions mcrypt \
    && install-php-extensions zip \
    && install-php-extensions bcmath \
    && install-php-extensions pdo_mysql \
    && install-php-extensions soap \
    && install-php-extensions redis \
    && install-php-extensions pcntl \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

WORKDIR /var/www
COPY . /var/www
VOLUME /var/www

EXPOSE 80 8000

CMD ["sh"]