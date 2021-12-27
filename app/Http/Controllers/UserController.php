<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use App\Models\User;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Gate;

class UserController extends Controller
{
    public function __construct()
    {
        $this->middleware(function ($request, $next) {
            if (Gate::allows('manage-users')) return $next($request);

            abort(403, 'Sorry bro, gak ada akses');
        });
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {

        $users = User::paginate(10);
        $keyword = $request->get('keyword');
        $status = $request->get('status');

        if ($status) {
            $users = User::where('status', $status)->paginate(10);
        } else {
            $users = User::paginate(10);
        }

        if ($keyword) {
            if ($status) {
                $users = User::where('email', 'LIKE', "%$keyword%")
                    ->where('status', $status)
                    ->paginate(10);
            } else {
                $users = User::where('email', 'LIKE', "%$keyword%")
                    ->paginate(10);
            }
        }

        return view('users.index', [
            "users" => $users,
        ]);
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

        if ($request->hasFile('avatar')) {
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
        return view('users.show', [
            'user' => User::findOrFail($id),
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $user = User::findOrFail($id);

        return view('users.edit', [
            'user' => $user
        ]);
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

        $user = User::findOrFail($id);

        $validator = $request->validate([
            'name' => 'required|min:3',
            'roles' => 'required',
            'address' => 'min:3',
            'phone' => 'min:3',
            'status' => 'required',
        ]);

        $validator['roles'] = json_encode($validator['roles']);

        if ($request->hasFile('avatar')) {
            $validator['avatar'] = $request->file('avatar')->store('avatars', 'public');
            if ($user->avatar !== 'avatars/nopic.png') {
                Storage::delete('public/' . $user->avatar);
            }
        }

        User::where('id', $id)->update($validator);

        return redirect()->route('users.edit', [$id])->with('status', "User Berhasil Diupdate");
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        User::where('id', $id)->delete();

        return redirect()->route('users.index')->with('status', "User Berhasil Dihapus");
    }
}
