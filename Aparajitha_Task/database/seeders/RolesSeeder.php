<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Role;

class RolesSeeder extends Seeder
{
    public function run()
    {
        // Create Admin Role
        Role::create(['name' => 'Admin']);

        // Create Accountant Role
        Role::create(['name' => 'Accountant']);
    }
}
