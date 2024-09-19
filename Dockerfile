FROM php:8.3-fpm

COPY . /var/www

WORKDIR /var/www

RUN apt update && apt install -y curl \
                    libpng-dev \
                    libonig-dev \
                    libxml2-dev \
                    libpq-dev \
                    zip \
                    unzip

RUN docker-php-ext-install pdo pdo_mysql mbstring exif pcntl bcmath gd

COPY --from=composer /usr/bin/composer /usr/bin/composer

RUN composer install

CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=80"]

EXPOSE 80