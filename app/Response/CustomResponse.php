<?php


namespace App\Response;


class CustomResponse
{
    public function is200Response($response, $responseMessage, $data = null)
    {
        $output = $data == null ? ["success" => true, "message" => $responseMessage] : ["success" => true, "data" => $data, "message" => $responseMessage] ;
        $responseMessage = json_encode($output);
        $response->getBody()->write($responseMessage);
        return $response->withHeader("Content-Type", "application/json")
            ->withStatus(200);
    }


    public function is400Response($response, $responseMessage)
    {
        $responseMessage = json_encode(["success" => false, "response" => $responseMessage]);
        $response->getBody()->write($responseMessage);
        return $response->withHeader("Content-Type", "application/json")
            ->withStatus(400);
    }

    public function is422Response($response, $responseMessage)
    {
        $responseMessage = json_encode(["success" => true, "response" => $responseMessage]);
        $response->getBody()->write($responseMessage);
        return $response->withHeader("Content-Type", "application/json")
            ->withStatus(422);
    }
}
