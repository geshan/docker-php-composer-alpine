FROM php:8.0-alpine

LABEL maintainer="David Zapata <jdavid.zapatab@gmail.com>"

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN chmod +x /usr/local/bin/install-php-extensions \
    && mkdir -p /var/www \
    && install-php-extensions xdebug gd mcrypt zip bcmath pdo_mysql soap redis \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

WORKDIR /var/www
COPY . /var/www
VOLUME /var/www

EXPOSE 80 8000

CMD ["sh"]