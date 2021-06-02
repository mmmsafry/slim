# SLIM api project 
This application uses the latest Slim 3 with Slim PSR-7 implementation with Laravel Eloquent library & JWT authentication.

### Project Installation

cloning repo 
```bash
git clone https://github.com/mmmsafry/slim
```

Install dependencies using composer 
```bash
composer install
```


### Database Backup
Create Database ``slim_db``

``slim_db.sql`` in root folder - import database   

update mysql credential in ``app\config\database.php``



### Run Project in local
```bash
php -S localhost:8080 -t public public/index.php
```

After that, open POSTMAN `http://localhost:8080` in your browser.

