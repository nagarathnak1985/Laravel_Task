<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Incomeexpense;
use Illuminate\Support\Facades\Auth;

class ExpenseController extends Controller
{
    // Display a list of expenses
    public function index()
    {
        // Fetch expenses with pagination
        $expenses = Incomeexpense::paginate(3);
        return view('expenses.index', compact('expenses'));
    }

    // Show the form to create a new expense
    public function create()
    {
        $types = ["Income", "Expense"];
        return view('expenses.create',compact('types'));
    }

    // Store a newly created expense in storage
    public function store(Request $request)
    {
        // Validate the request data
        $request->validate([
            'item' => 'required|string|max:255',
            'type' => 'required|string|max:255',
            'amount' => 'required|numeric',
        ]);
        
        // Add the user_id to the request data
        $data = $request->all(); // Get all request data
        $data['user_id'] = Auth::id(); 
        Incomeexpense::create($data);

        // Redirect to the list of expenses with a success message
        return redirect()->route('expense.index')->with('success', 'Expense created successfully.');
    }

    // Display a specific expense
    public function show($id)
    {
        $expense = Incomeexpense::findOrFail($id);
        return view('expense.show', compact('expense'));
    }

    // Show the form to edit an existing expense
    public function edit($id)
    {
        $types = ["Income", "Expense"];
        $expense = Incomeexpense::findOrFail($id);
        $selectedType = $expense->type;
        return view('expenses.edit', compact('expense','types','selectedType'));
    }

    // Update a specific expense in storage
    public function update(Request $request, $id)
    {
        // Validate the request data
        $request->validate([
            'item' => 'required|string|max:255',
            'type' => 'required|string|max:255',
            'amount' => 'required|numeric',
        ]);

        // Find the expense and update its details
        $expense = Incomeexpense::findOrFail($id);
        $expense->update($request->all());

        // Redirect to the list of expenses with a success message
        $expenses = Incomeexpense::paginate(3);
        return redirect()->route('expense.index')->with('success', 'Expense updated successfully.');
        
    }

    // Remove a specific expense from storage
    public function destroy($id)
    {
        // Find the expense and delete it
        $expense = Incomeexpense::findOrFail($id);
        $expense->delete();

        // Redirect to the list of expenses with a success message
        return redirect()->route('expense.index')->with('success', 'Expense deleted successfully.');
    }
}
