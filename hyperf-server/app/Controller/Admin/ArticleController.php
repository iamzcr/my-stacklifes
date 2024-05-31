<?php

namespace App\Controller\Admin;

use App\Controller\AbstractController;

class ArticleController extends AbstractController
{
    public function index()
    {
        $user = $this->request->input('user', 'Hyperf');
        $method = $this->request->getMethod();

        return [
            'method' => $method,
            'message' => "Hello article {$user}.",
        ];
    }
}