FROM php:7.3-fpm

COPY composer.json /var/www/

WORKDIR /var/www

# Update packages
RUN apt-get update

# Install PHP and composer dependencies
RUN apt-get install -qq git curl libmcrypt-dev libjpeg-dev libpng-dev libfreetype6-dev libbz2-dev libzip-dev libjpeg62-turbo-dev 


# Clear out the local repository of retrieved package files
# RUN apt-get clean


# Install needed extensions
# Here you can install any other extension that you need during the test and deployment process
RUN apt-get clean; docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ && \
docker-php-ext-install pdo pdo_mysql zip gd pcntl opcache bcmath


# Installs Composer to easily manage your PHP dependencies.
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer





# Install Node
RUN apt-get update &&\
    apt-get install -y --no-install-recommends gnupg &&\
    curl -sL https://deb.nodesource.com/setup_10.x | bash - &&\
    apt-get update &&\
    apt-get install -y --no-install-recommends nodejs &&\
    npm config set registry https://registry.npm.taobao.org --global &&\
    npm install --global gulp-cli
	
# Add UID '1000' to www-data
RUN usermod -u 1000 www-data

# Copy existing application directory permissions
COPY --chown=www-data:www-data . /var/www

# Change current user to www
USER www-data	

CMD php-fpm
