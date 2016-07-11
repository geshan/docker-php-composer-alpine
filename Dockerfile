FROM alpine:3.3

Maintainer Geshan Manandhar <geshan@gmail.com>

RUN apk --update add wget curl git php php-curl php-openssl php-json php-phar php-dom && rm /var/cache/apk/*

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer 

RUN mkdir -p /var/www

WORKDIR /var/www

COPY . /var/www

VOLUME /var/www

CMD ["/bin/sh"]

ENTRYPOINT ["/bin/sh", "-c"]
