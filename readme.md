## Docker Container for PHP and Composer

This is a docker container for PHP 5.6 with composer installed. It can be used with
any PHP project using composer. As this image is build on top of the
[Alpine Linux](http://www.alpinelinux.org/) base image its very small at `~39 MB`.
You can check the [PHP 7](https://github.com/geshan/docker-php-composer-alpine/tree/php7-branch) version too.

[![](https://badge.imagelayers.io/geshan/php-composer-alpine:latest.svg)](https://imagelayers.io/?images=geshan/php-composer-alpine:latest 'Get your own badge on imagelayers.io')

## Pull it from docker registry

To pull the docker image you can do it with:

```
docker pull geshan/php-composer-alpine
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
FROM geshan/php-composer-alpine

//my docker image contents
```
