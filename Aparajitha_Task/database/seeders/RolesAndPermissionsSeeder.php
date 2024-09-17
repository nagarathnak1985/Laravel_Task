<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;

class RolesAndPermissionsSeeder extends Seeder
{
    public function run()
    {
        // Create permissions
        Permission::create(['name' => 'manage entries']);
        Permission::create(['name' => 'view all entries']);
        Permission::create(['name' => 'manage permissions']);

        // Create roles
        $adminRole = Role::create(['name' => 'Admin']);
        $accountantRole = Role::create(['name' => 'Accountant']);

        // Assign permissions to roles
        $adminRole->givePermissionTo(['manage entries', 'view all entries', 'manage permissions']);
        $accountantRole->givePermissionTo('manage entries');
    }
}
