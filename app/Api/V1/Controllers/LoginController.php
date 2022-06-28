<?php

namespace App\Api\V1\Controllers;

use Symfony\Component\HttpKernel\Exception\HttpException;
use Tymon\JWTAuth\JWTAuth;
use App\Http\Controllers\Controller;
use App\Api\V1\Requests\LoginRequest;
use Tymon\JWTAuth\Exceptions\JWTException;
use Symfony\Component\HttpKernel\Exception\AccessDeniedHttpException;
use Symfony\Component\HttpKernel\Exception\UserInactiveHttpException;
use Symfony\Component\HttpKernel\Exception\InvalidEmailHttpException;
use Illuminate\Support\Facades\DB;
use Auth;
use GuzzleHttp\Psr7\Request;
use App\User;

class LoginController extends Controller
{
    /**
     * Log the user in
     *
     * @param LoginRequest $request
     * @param JWTAuth $JWTAuth
     * @return \Illuminate\Http\JsonResponse
     */
    /**
     * @OA\Post(
     *     path="/api/auth/login",
     *     tags={"login"},
     *     summary="Returns a Sample API response",
     *     description="A sample login to test out the API",
     *     operationId="greet",
     *     @OA\Parameter(
     *          name="email",
     *          required=true,
     *          in="query",
     *          @OA\Schema(
     *              type="string"
     *          )
     *     ),
     *     @OA\Parameter(
     *          name="password",
     *          required=true,
     *          in="query",
     *          @OA\Schema(
     *              type="string"
     *          )
     *     ),
     *     @OA\Response(
     *         response="default",
     *         description="successful operation"
     *     )
     * )
     */
    public function login(LoginRequest $request, JWTAuth $JWTAuth)
    {
        $credentials = $request->only(['email', 'password']);

        try {
            $token = Auth::guard()->attempt($credentials);

            if (!$token) {
                throw new AccessDeniedHttpException();
            }
        } catch (JWTException $e) {
            throw new HttpException(500,"Internal server problem");
        }

        return response()
            ->json([
                'status' => 'ok',
                'token' => $token,
                'expires_in' => Auth::guard()->factory()->getTTL() * 60,
                'user' => Auth::guard()->user()
            ]);
    }
}
