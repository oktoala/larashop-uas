# UAS FRAMEWORK - LARAVEL


+ [Cara Install](#cara-install)

## Cara Install

1. Clone repo ini

    ```bash
    git clone https://github.com/oktoala/larashop-uas.git
    ```

2. Inisialisasi project menggunakan `composer`.

    ```bash
    cd larashop-uas
    composer install
    ```

3. Generate file `.env`

    ```bash
    cp .env.example .env
    php artisan key:generate
    ```

4. Kalian bebas mau mengisi database dengan cara export sqlnya atau migrasi dengan seeder.

    4.1. Untuk export sql, tinggal export saja `larashop_uas.sql` ke MySQL kalian.

    4.2. Untuk cara migrasi, buat dulu database bernama `larashop_uas`. Lalu jalankan migrasi dengan seedernya.

        ```bash
        php artisan migrate:fresh --seed
        ```

5. Jika gambar tidak muncul, jalankan perintah `php artisan storage:link`

