<?php


namespace App\Controllers;

use App\Models\Category;
use App\Requests\CustomRequestHandler;
use App\Response\CustomResponse;
use App\Validation\Validator;
use Psr\Http\Message\RequestInterface as Request;
use Psr\Http\Message\ResponseInterface as Response;
use Respect\Validation\Validator as v;

class CategoryController
{
    protected $customResponse;
    protected $categoryModel;
    protected $validator;


    public function __construct()
    {
        $this->customResponse = new CustomResponse();
        $this->categoryModel = new Category();
        $this->validator = new Validator();
    }

    /**
     * This is method is not used anywhere in the Angular Frontend.
     */
    public function getCategory(Request $request, Response $response)
    {
        $category = $this->categoryModel->all();
        $this->customResponse->is200Response($response, "Category retrieved successfully", $category);
    }

    /**
     * This is the method for retrieve category tree data - used in Front end
     */
    public function getCategoryTree(Request $request, Response $response)
    {
        $category = $this->categoryModel->with(['children' => function ($q) {
            $q->with('children');
        }])->where('parent', 0)->whereNull('deleted_at')->get();
        $this->customResponse->is200Response($response, "Category tree retrieved successfully", $category);
    }

    public function store(Request $request, Response $response)
    {
        $this->validator = new Validator();
        $this->validator->validate($request, [
            "description" => v::notEmpty()
        ]);

        if ($this->validator->failed()) {
            $responseMessage = $this->validator->errors;
            return $this->customResponse->is400Response($response, $responseMessage);
        }

        $this->categoryModel->create([
            "description" => CustomRequestHandler::getParam($request, "description"),
            "parent" => CustomRequestHandler::getParam($request, "parent")
        ]);

        $responseMessage = "Category created successfully";

        $this->customResponse->is200Response($response, $responseMessage);
    }

    /** Implemented Manual soft Delete */
    public function deleteSelected(Request $request, Response $response, $id)
    {
        $this->validator = new Validator();
        $this->validator->validate($request, [
            "ids" => v::notEmpty()
        ]);

        if ($this->validator->failed()) {
            $responseMessage = $this->validator->errors;
            return $this->customResponse->is400Response($response, $responseMessage);
        }

        $ids = CustomRequestHandler::getParam($request, "ids");

        $date = date('Y-m-d H:i:s');
        $this->categoryModel->whereIn('id', $ids)->update(["deleted_at" => $date]);

        $responseMessage = "Selected Categories are deleted successfully";

        $this->customResponse->is200Response($response, $responseMessage);
    }


}
