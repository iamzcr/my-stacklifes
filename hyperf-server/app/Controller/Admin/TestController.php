<?php

namespace App\Controller\Admin;

use App\Controller\AbstractController;
use Hyperf\HttpServer\Annotation\AutoController;

#[AutoController]
class TestController extends AbstractController
{
    public function index()
    {
        $user = $this->request->input('user', 'Hyperf');
        $method = $this->request->getMethod();

        return [
            'method' => $method,
            'message' => "Hello admin {$user}.",
        ];
    }
}