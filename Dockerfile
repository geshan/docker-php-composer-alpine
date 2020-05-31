FROM php:7.4-alpine

LABEL maintainer="David Zapata <jdavid.zapatab@gmail.com>"

RUN mkdir -p /var/www \
    && apk add --no-cache $PHPIZE_DEPS \
    && pecl install xdebug && docker-php-ext-enable xdebug \
    && docker-php-ext-install bcmath \ 
    && docker-php-ext-install pdo_mysql \ 
    && pecl install redis && docker-php-ext-enable redis \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

WORKDIR /var/www
COPY . /var/www
VOLUME /var/www

EXPOSE 80 8000

CMD ["sh"]