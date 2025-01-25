<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;

class AuthController extends Controller
{
public function register(Request $request)
{
    $validation = $request->validate([
        'name' => 'required',
        'email' => 'required|email|unique:users,email',
        'password' => 'required|min:6'
    ]);

    $validation['password'] = bcrypt($request->password);

    $user = User::create($validation);

    $token = $user->createToken('auth_token')->plainTextToken;

    return response()->json([
        'message' => 'User berhasil register',
        'user' => $user,
        'token' => $token
    ], 201);
}

public function login(Request $request)
{
    $validation = $request->validate([
        'email' => 'required|email',
        'password' => 'required'
    ]);

    if (!auth()->attempt($validation)) {
        return response()->json([
            'message' => 'Email atau password salah'
        ], 401);
    }

    $token = auth()->user()->createToken('auth_token')->plainTextToken;

    return response()->json([
        'message' => 'Berhasil login',
        'user' => auth()->user(),
        'token' => $token
    ]);
}

public function logout(Request $request)
{
    $request->user()->tokens()->delete();

    return response()->json([
        'message' => 'Berhasil logout'
    ]);
}

}