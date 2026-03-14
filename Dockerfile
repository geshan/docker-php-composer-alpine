FROM php:8.2-alpine

LABEL maintainer="David Zapata <jdavid.zapatab@gmail.com>"

# Install-php-extensions script
ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

# Update Alpine and install PHP extensions.
# Note: If critical CVEs persist after 'apk upgrade', consider pulling newer
# versions of specific packages from the edge repository as a temporary workaround.
# For example, to mitigate CVEs in tar, curl, libcurl, and busybox.
#
# Example command for CVE scanning (run after build):
# docker scout cves davidzapata/php-composer-alpine:8.2
# or
# trivy image davidzapata/php-composer-alpine:8.2
RUN chmod +x /usr/local/bin/install-php-extensions && \
    apk update && \
    apk upgrade && \
    apk add -u --no-cache --repository https://dl-cdn.alpinelinux.org/alpine/edge/main \
        tar \
        curl \
        libcurl \
        busybox && \
    install-php-extensions \
        xdebug \
        gd \
        mcrypt \
        zip \
        bcmath \
        pdo_mysql \
        soap \
        redis \
        pcntl \
        mongodb \
        sockets && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer && \
    rm -rf /var/cache/apk/*

WORKDIR /var/www
COPY . /var/www
VOLUME /var/www

EXPOSE 80 8000

CMD ["sh"]