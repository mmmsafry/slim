<?php


namespace App\Controllers;


use App\interfaces\SecretKeyInterface;
use Firebase\JWT\JWT;

class GenerateTokenController extends SecretKeyInterface
{
    public static function generateToken($email)
    {
        $now = time();
        $future = strtotime('+3 hour', $now);
        $secret = GenerateTokenController::JWT_SECRET_KEY;

        $payload = [
            "jti" => $email,
            "iat" => $now,
            "exp" => $future
        ];

        return JWT::encode($payload, $secret, "HS256");
    }
}

