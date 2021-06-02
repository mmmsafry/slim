<?php

use Slim\App;

require __DIR__ . "/../vendor/autoload.php";

$settings = require __DIR__ . "/settings.php";

$app = new App($settings);

$container = $app->getContainer();

//require __DIR__ . "/errorHandler.php";

require __DIR__ . "/routes.php";

require __DIR__ . "/database.php";

$middleware = require __DIR__ . "/middleware.php";
$middleware($app);

$app->run();
