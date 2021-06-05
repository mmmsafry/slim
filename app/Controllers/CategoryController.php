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
    private $tree;


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

    

    private function buildTree(array $elements, $parentId = 0) {
        $branch = array();
    
        foreach ($elements as $element) {
            if ($element['parent'] == $parentId) {
                $children = $this->buildTree($elements, $element['id']);
                if ($children) {
                    $element[$element['description']] = $children;
                }
                $branch[] = $element;
            }
        }
    
        return $branch;
    }

    private function getChild($id){
        
        return array_filter($this->tree, function($e) use ($id){
            // if($this->getChild($e['parent'])!=null){
            //     return $e;
            // }

            return  $e['parent'] == $id;

        });

    }

    /**
     * This is the method for retrieve category tree data - used in Front end
     */
    public function getCategoryTree(Request $request, Response $response)
    {
        $category = $this->categoryModel->select('id', 'description', 'parent')->whereNull('deleted_at')->get();
        $categoryArray = json_decode(json_encode($category), true);

        $tree = $this->buildTree($categoryArray);
        $formatedTree = $this->formatTree($tree);

        $this->customResponse->is200Response($response, "Category tree retrieved successfully", $formatedTree);
    }

    private function formatTree(array $tree){
        return $tree;
        return array_reduce($tree, function($e){
            return $e['description'];
        },'root');
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
