<?php

use App\Controllers\AuthController;
use App\Controllers\CategoryController;

$app->get('/categories', CategoryController::class . ':getCategory');  
$app->get('/category-tree', CategoryController::class . ':getCategoryTree');
$app->post('/add-category', CategoryController::class . ':store');
$app->post('/delete-selected-category', CategoryController::class . ':deleteSelected');


$app->group("/auth", function () use ($app) {
    $app->post("/login", AuthController::class . ":Login");
    $app->get("/test", AuthController::class . ":test");
});
