<?php

use Illuminate\Database\Capsule\Manager;

$database_config = [
    "driver" => "mysql",
    "host" => "localhost",
    "database" => "slim_db",
    "username" => "root",
    "password" => "root",
    "charset" => "utf8",
    "collation" => "utf8_unicode_ci",
    "prefix" => ""
];


$capsule = new Manager;

$capsule->addConnection($database_config);

$capsule->setAsGlobal();

$capsule->bootEloquent();

return $capsule;
