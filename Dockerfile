FROM docker.io/bitnami/laravel:latest
COPY . .
COPY .env.example .env

RUN composer install --optimize-autoloader;
RUN php artisan key:generate;
RUN php artisan migrate;
RUN php artisan db:seed;

CMD php artisan serve --host=0.0.0.0
EXPOSE 443
