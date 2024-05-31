<?php

declare(strict_types=1);

/**
 * This file is part of Hyperf.
 *
 * @link     https://www.hyperf.io
 * @document https://hyperf.wiki
 * @contact  group@hyperf.io
 * @license  https://github.com/hyperf/hyperf/blob/master/LICENSE
 */

use Hyperf\HttpServer\Router\Router;

//闭包方式定义路由:http://ip:9501/favicon.ico
Router::get('/favicon.ico', function () {
    return 'favicon.ico';
});

//多个请求方式定义路由：访问方式：http://ip:9501/
Router::addRoute(['GET', 'POST', 'HEAD'], '/', 'App\Controller\IndexController@index');

//标准路由定义：访问方式：http://ip:9501/hello
Router::get('/hello', 'App\Controller\IndexController::hello');
Router::post('/hello_post', 'App\Controller\IndexController::helloPost');

//路由组方式定义路由：访问方式：http://ip:9501/admin/index
Router::addGroup('/admin/', function () {
    Router::get('index', 'App\Controller\Admin\IndexController@index');
    Router::post('category', 'App\Controller\Admin\CategoryController@index');
    Router::get('article', 'App\Controller\Admin\ArticleController@index');
});

