FROM php:8.3-fpm

ARG user
ARG uid

RUN apt update && apt install -y curl \
                    libpng-dev \
                    libonig-dev \
                    libxml2-dev \
                    libpq-dev \
                    zip \
                    unzip

RUN docker-php-ext-install pdo pdo_mysql mbstring exif pcntl bcmath gd

COPY --from=composer /usr/bin/composer /usr/bin/composer

RUN useradd -G www-data,root -u $uid -d /home/$user $user
RUN mkdir -p /home/$user/.composer && \
    chown -R $user:$user /home/$user

WORKDIR /var/www

USER $user

EXPOSE 9000