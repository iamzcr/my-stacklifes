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
<<<<<<< HEAD
//多个请求方式定义路由：访问方式：http://121.196.237.108:9501/

Router::addRoute(['GET', 'POST', 'HEAD'], '/', 'App\Controller\IndexController@index');

//标准路由定义：访问方式：http://121.196.237.108:9501/hello
Router::get('/hello', 'App\Controller\IndexController::hello');

//闭包方式定义路由
Router::get('/favicon.ico', function () {
    return '';
});

//路由组方式定义路由：访问方式：http://121.196.237.108:9501/user/index
Router::addGroup('/user/',function (){
    Router::get('index','App\Controller\UserController@index');
});
=======

Router::addRoute(['GET', 'POST', 'HEAD'], '/', 'App\Controller\IndexController@index');

Router::get('/favicon.ico', function () {
    return '';
});
>>>>>>> 9c85592969dd2908e3fcb07d63a01c36242f095f
