FROM php:7.3-alpine

LABEL maintainer="David Zapata <jdavid.zapatab@gmail.com>"

RUN mkdir -p /var/www \
    && docker-php-ext-install bcmath \ 
    && docker-php-ext-install pdo_mysql \ 
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer 

WORKDIR /var/www
COPY . /var/www
VOLUME /var/www

EXPOSE 80 8000

CMD ["sh"]