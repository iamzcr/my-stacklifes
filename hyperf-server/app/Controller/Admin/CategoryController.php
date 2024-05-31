<?php

namespace App\Controller\Admin;

use App\Controller\AbstractController;

class CategoryController extends AbstractController
{
    public function index()
    {
        $user = $this->request->input('user', 'Hyperf');
        $method = $this->request->getMethod();

        return [
            'method' => $method,
            'message' => "Hello category {$user}.",
        ];
    }
}