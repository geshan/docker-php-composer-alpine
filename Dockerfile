FROM php:8.2-alpine

LABEL maintainer="David Zapata <jdavid.zapatab@gmail.com>"

RUN apk update && apk upgrade
RUN sync
ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
RUN chmod +x /usr/local/bin/install-php-extensions
RUN mkdir -p /var/www
RUN install-php-extensions xdebug
RUN install-php-extensions gd
RUN install-php-extensions mcrypt
RUN install-php-extensions zip
RUN install-php-extensions bcmath
RUN install-php-extensions pdo_mysql
RUN install-php-extensions soap
RUN install-php-extensions redis
RUN install-php-extensions pcntl
RUN install-php-extensions mongodb
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

WORKDIR /var/www
COPY . /var/www
VOLUME /var/www

EXPOSE 80 8000

CMD ["sh"]