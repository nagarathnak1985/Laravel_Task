<?php

namespace App\Http\Controllers;

use Spatie\Permission\Models\Role;
use Illuminate\Http\Request;

class RoleController extends Controller
{
    public function index()
    {
        $users = $roles = Role::paginate(3); 
        return view('roles.roles', compact('roles'));
    }
    //add-roles
    public function addRoles(){
        return view('roles.addrole');
    }

    
    // Save role 
    public function store(Request $request)
    {
        
        // Validate the incoming request data
        $validatedData = $request->validate([
            'name' => 'required|string|max:255',
        ]);
        // Create a new role record
        Role::create([
            'name' => $validatedData['name'],

        ]);

        // Redirect to a success page or back to the form with a success message
        return redirect()->route('role.management')->with('success', 'User added successfully!');
    }

    public function createRoles()
    {
        // Check if the roles already exist to avoid duplication
        if (Role::where('name', 'Admin')->doesntExist()) {
            Role::create(['name' => 'Admin']);
        }

        if (Role::where('name', 'Accountant')->doesntExist()) {
            Role::create(['name' => 'Accountant']);
        }

        return response()->json(['message' => 'Roles created successfully']);
    }
}
