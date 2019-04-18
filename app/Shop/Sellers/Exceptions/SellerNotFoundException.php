<?php

namespace App\Shop\Sellers\Exceptions;

use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;

class SellerNotFoundException extends NotFoundHttpException
{

    /**
     * SellerNotFoundException constructor.
     */
    public function __construct()
    {
        parent::__construct('Seller not found.');
    }
}