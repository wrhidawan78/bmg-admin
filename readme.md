
## How to initialize project 

Clone the project & setup the `.env` file
```sh
$ git clone https://github.com/wrhidawan78/flm-backend.git
$ cp .env.example .env
```

Initialize the projects
```sh
$ composer install
$ php artisan key:generate
$ php artisan migrate
$ php artisan config:cache
$ php artisan serve --port=8000
```
---

