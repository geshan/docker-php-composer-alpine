FROM php:8.0-alpine

LABEL maintainer="David Zapata <jdavid.zapatab@gmail.com>"

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

# RUN chmod +x /usr/local/bin/install-php-extensions \
#     && mkdir -p /var/www \
#     && apk add --no-cache $PHPIZE_DEPS \
#     && apk add --no-cache zip libzip-dev libxml2-dev libmcrypt-dev \
#     && pecl install xdebug && docker-php-ext-enable xdebug \
#     && pecl install --nodeps mcrypt-snapshot && docker-php-ext-enable mcrypt \
#     && docker-php-ext-configure zip \
#     && docker-php-ext-install bcmath \
#     && docker-php-ext-install zip \
#     && docker-php-ext-install pdo_mysql \
#     && docker-php-ext-install soap \
#     && install-php-extensions gd \
#     && pecl install redis && docker-php-ext-enable redis \
#     && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

RUN chmod +x /usr/local/bin/install-php-extensions && mkdir -p /var/www
RUN install-php-extensions xdebug
RUN install-php-extensions gd
RUN install-php-extensions mcrypt
RUN install-php-extensions zip
RUN install-php-extensions bcmath
RUN install-php-extensions pdo_mysql
RUN install-php-extensions soap
RUN install-php-extensions redis
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

WORKDIR /var/www
COPY . /var/www
VOLUME /var/www

EXPOSE 80 8000

CMD ["sh"]