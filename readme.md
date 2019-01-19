## Docker Container for PHP 7.3 and Composer

This is a docker container for PHP 7.3 with composer installed. It can be used with
any PHP project using composer. As this image is build on top of the
[Alpine Linux](http://www.alpinelinux.org/) base image its very small.

Based on [geshan/docker-php-composer-alpine](https://github.com/geshan/docker-php-composer-alpine).

## Pull it from docker registry

To pull the docker image you can do it with:

```
docker pull davidzapata/php-composer-alpine
```

## Usage

After pulling the image from docker registry, go into any project that has a composer.json.
Then run the following commands to run php or composer:

```
docker run --rm -v $(pwd):/var/www davidzapata/php-composer-alpine "composer install --prefer-dist"
```
Lets say if you are have PHPUnit in your composer.json, you can run the following commands
to run your tests:

```
docker run --rm -v $(pwd):/var/www davidzapata/php-composer-alpine "./vendor/bin/phpunit --version"
docker run --rm -v $(pwd):/var/www davidzapata/php-composer-alpine "./vendor/bin/phpunit"
```

## As base image

You can use it as a base image like below:

```
FROM davidzapata/php-composer-alpine

//my docker image contents
```