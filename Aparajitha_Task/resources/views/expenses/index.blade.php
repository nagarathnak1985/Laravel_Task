@extends('layouts.app')

@section('content')
    <div class="container mt-5">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2>Income and Expense List</h2>
            @if(Auth::user()->name == "Accountant")
            <a href="{{ route('expense.create')}}" class="btn btn-primary">Add Expense</a>
            @endif
        </div>

        <table class="table table-striped table-bordered">
            <thead class="thead-dark">
                <tr>
                    <th>Sl No</th>
                    <th>Item</th>
                    <th>Type</th>
                    <th>User</th>
                    <th>Amount</th>
                    @if(Auth::user()->name == "Accountant") <!-- Check if the authenticated user is an Accountant -->
                        <th>Action</th>
                    @endif
                </tr>
            </thead> 
            <tbody>
                <?php $totalAmount = 0; ?>
                @foreach($expenses as $index => $expense)
                    <?php $totalAmount += (int)$expense->amount; ?>
                    <tr id="expense-{{ $expense->id }}">
                        <td>{{ $index + 1 }}</td>
                        <td>{{ $expense->item }}</td>
                        <td>{{ $expense->type }}</td>
                        <td>{{ $expense->user->name }}</td> <!-- Assuming user relationship exists in the model -->
                        <td>{{ $expense->amount }}</td>
                        
                        @if(Auth::user()->name == "Accountant")
                        <td>
                            <a href="{{ route('expense.edit',$expense->id )  }}" class="btn btn-warning btn-sm">Edit</a>
                            <form action="{{ route('expense.destroy',$expense->id )  }}" method="POST" style="display:inline;">
                                @csrf
                                @method('DELETE')
                                <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this expense?')">Delete</button>
                            </form>
                        </td>
                        @endif
                    </tr>
                @endforeach
                <!-- Total amount row -->
                <tr>
                    <td colspan="4" class="text-right"><strong>Total:</strong></td>
                    <td colspan="2">{{ $totalAmount }}</td>
                </tr>
            </tbody>   
        </table>
        <!-- Pagination links -->
        {{ $expenses->links() }}
    </div>
@endsection
