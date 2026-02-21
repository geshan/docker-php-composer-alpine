## Docker Container for PHP 8.2 and Composer

This is a docker container for PHP 8.2 with composer installed. It can be used with
any PHP project using composer. As this image is built on top of the
[Alpine Linux](http://www.alpinelinux.org/) base image, it is tiny.

## Build

To build this image, apply any necessary changes to the Dockerfile and build the image like this:

    docker buildx build --platform linux/amd64 -t davidzapata/php-composer-alpine:8.2 .

## Pull it from the docker registry

To pull the docker image, you can do it with:

```
docker pull davidzapata/php-composer-alpine
```

## Usage

After pulling the image from the docker registry, go into any project that has a composer.json.
Then run the following commands to run php or composer:

```
docker run --rm -v $(pwd):/var/www davidzapata/php-composer-alpine:8.2 composer install --prefer-dist
```

To create a Laravel project using this image (for example, a blog), run:
```
cd my_dir
docker run --rm -v $(pwd):/var/www davidzapata/php-composer-alpine:8.2 composer create-project --prefer-dist laravel/laravel blog
cd blog
```

Using the sample laravel project, you can test it with:

```
docker run --rm -v $(pwd):/var/www davidzapata/php-composer-alpine:8.2 ./vendor/bin/phpunit
```

Or you can serve it using:
```
docker run --rm -p 80:80 -v $(pwd):/var/www davidzapata/php-composer-alpine:8.2 php -S 0.0.0.0:80 -t public
```

## As a base image

You can use it as a base image like below:

```
FROM davidzapata/php-composer-alpine:8.2

// my docker image contents
```