<?php
namespace App\Policies;

use App\Models\Expense;
use App\Models\User;
use Illuminate\Auth\Access\HandlesAuthorization;

class ExpensePolicy
{
    use HandlesAuthorization;

    // Admin = 1, Accountant = 2
    

    // Both Admins and Accountants can view expenses
    public function viewAny(User $user)
    {
      // Admins (role === 1) and Accountants (role === 2) can view expenses
        return $user->role === 1 || $user->role === 2;
    }

    public function create(User $user)
    {
        // Only Accountants can create expenses
        return $user->role === 2;
    }

    public function edit(User $user)
    {
        // Accountants can only edit 
        return $user->role === 2 ;
    }

    
    public function update(User $user)
    {
        // Accountants can only update
        return $user->role === 2 ;
    }
    public function delete(User $user)
    {
        // Accountants can only delete 
        return $user->role === 2;
    }

    // Add more authorization methods as needed
}
