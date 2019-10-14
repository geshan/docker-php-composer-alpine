## Docker Container for PHP7 and Composer

This is a docker container for PHP7.3 with composer 1.9.0 installed. It can be used with
any PHP project using composer. As this image is build on top of the
[Alpine Linux](http://www.alpinelinux.org/) base image its very small at `~39 MB`.

[![](https://badge.imagelayers.io/geshan/php-composer-alpine:php7.svg)](https://imagelayers.io/?images=geshan/php-composer-alpine:php7 'Get your own badge on imagelayers.io')

## Pull it from docker registry

To pull the docker image you can do it with:

```
docker pull geshan/php-composer-alpine:php7
```

## Usage

After pulling the image from docker registry, go into any project that has a composer.json.
Then run the following commands to run php or composer:

```
docker run -v $(pwd):/var/www geshan/php-composer-alpine "composer install --prefer-dist"
```
Lets say if you are have PHPUnit in your composer.json, you can run the following commands
to run your tests:

```
docker run -v $(pwd):/var/www geshan/php-composer-alpine "./vendor/bin/phpunit --version"
docker run -v $(pwd):/var/www geshan/php-composer-alpine "./vendor/bin/phpunit"
```

## As base image

You can use it as a base image like below:

```
FROM geshan/php-composer-alpine:php7

//my docker image contents
```
