<?php


namespace App\Controllers;

use App\Models\User;
use App\Requests\CustomRequestHandler;
use App\Response\CustomResponse;
use App\Validation\Validator;
use Psr\Http\Message\RequestInterface as Request;
use Psr\Http\Message\ResponseInterface as Response;
use Respect\Validation\Validator as v;


class AuthController
{
    protected $customResponse;

    protected $user;

    protected $validator;

    public function __construct()
    {
        $this->customResponse = new CustomResponse();

        $this->user = new User();

        $this->validator = new Validator();
    }


    public function hashPassword($password)
    {
        return password_hash($password, PASSWORD_DEFAULT);
    }

    public function test(Request $request, Response $response)
    {
        $passwordHash = $this->hashPassword('12345');
        return $this->customResponse->is200Response($response, $passwordHash);
    }

    public function Login(Request $request, Response $response)
    {
        $this->validator->validate($request, [
            "email" => v::notEmpty()->email(),
            "password" => v::notEmpty()
        ]);

        if ($this->validator->failed()) {
            $responseMessage = $this->validator->errors;
            return $this->customResponse->is400Response($response, $responseMessage);
        }

        $verifyAccount = $this->verifyAccount(CustomRequestHandler::getParam($request, "password"),
            CustomRequestHandler::getParam($request, "email"));

        if ($verifyAccount == false) {
            $responseMessage = "invalid username or password";

            return $this->customResponse->is400Response($response, $responseMessage);
        }

        $responseMessage = GenerateTokenController::generateToken(CustomRequestHandler::getParam($request, "email"));

        return $this->customResponse->is200Response($response, $responseMessage);
    }

    public function verifyAccount($password, $email)
    {
        $hashPassword = "";
        $count = $this->user->where(["email" => $email])->count();

        if ($count == false) {
            return false;
        }

        $user = $this->user->where(["email" => $email])->get();

        foreach ($user as $users) {
            $hashPassword = $users->password;
        }

        $verify = password_verify($password, $hashPassword);

        if ($verify == false) {
            return false;
        }

        return true;
    }

}
