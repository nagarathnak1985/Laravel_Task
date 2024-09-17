<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Incomeexpense;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;
use  App\Models\User;
use Illuminate\Support\Facades\Hash;


class UsersController extends Controller
{
    public function index()
    {
        $users = User::with('role')->paginate(3); 
        return view('userslist', compact('users'));
    }

    public function create(){
        $roles = Role::all();
        return view('adduser', compact(['roles']));
    }

    // Save user 
    public function store(Request $request)
    {
        
        // Validate the incoming request data
        $validatedData = $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|email|unique:users,email',
            'password' => 'required|string|min:8',
            'role' => 'required|exists:roles,id',
        ]);
        //dd($validatedData);
        // Create a new user record
        User::create([
            'name' => $validatedData['name'],
            'email' => $validatedData['email'],
            'password' => Hash::make($validatedData['password']),
            'role' => $validatedData['role'],

        ]);

        // Redirect to a success page or back to the form with a success message
        //return redirect()->route('user.index'); // Redirect after saving
        return redirect()->route('userslist');
        //return redirect()->route('/userslist')->with('success', 'User added successfully!');
    }
}
