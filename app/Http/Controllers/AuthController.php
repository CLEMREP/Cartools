<?php

namespace App\Http\Controllers;

use App\Http\Requests\LoginRequest;
use App\Http\Requests\RegisterRequest;
use App\Repositories\UserRepository;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    public function __construct(
        private readonly UserRepository $userRepository,
    ) {
    }

    public function register(RegisterRequest $request): Response
    {
        /** @var array $data */
        $data = $request->validated();

        $data['password'] = Hash::make($data['password']);

        $user = $this->userRepository->create($data);

        $token = $user->createToken('Cartools')->plainTextToken;

        $response = [
            'user' => $user,
            'token' => $token,
        ];

        return response($response, 201);
    }

    public function login(LoginRequest $request): Response
    {
        /** @var array $data */
        $data = $request->validated();

        $user = $this->userRepository->checkEmail($data['email']);

        if (! $user || ! Hash::check($data['password'], $user->password)) {
            return response([
                'message' => 'Les informations ne sont pas correctes.',
            ], 401);
        }

        $token = $user->createToken('Cartools')->plainTextToken;

        $response = [
            'user' => $user,
            'token' => $token,
        ];

        return response($response, 200);
    }

    public function logout(Request $request): array
    {
        auth()->user()?->tokens()->delete();

        return [
            'message' => 'Déconnexion réussie.',
        ];
    }
}
