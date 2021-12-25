<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use App\Models\User;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view("users.create");
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validator = $request->validate([
            'username' => 'required|min:3',
            'name' => 'required|min:3',
            'roles' => 'required',
            'address' => 'min:3',
            'phone' => 'min:3',
            'email' => 'required|email:dns',
            'password' => 'required|min:3|confirmed',
        ]);
        $validator['roles'] = json_encode($validator['roles']);
        $validator['password'] = Hash::make($validator['password']);
        $validator['avatar'] = "avatars/nopic.png";

        if ($request->hasFile('avatar')){
            $validator['avatar'] = $request->file('avatar')->store('avatars', 'public');
        }

        User::create($validator);

        return redirect()->route('users.create')->with('status', "User Berhasil Dibuat");
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
