@extends('layouts.app')

@section('content')
    <div class="container mt-5">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2>Role List</h2>
            @if(Auth::user()->name == "Admin")
            <a href="/add-roles" class="btn btn-primary">Add Role</a>
            @endif
        </div>

        <table class="table table-striped table-bordered">
    <thead class="thead-dark">
        <tr>
            <th>Sno</th>
            <th>Name</th>
        </tr>
    </thead> 
    <tbody>
        @foreach($roles as $index => $role)
            <tr>
                <td>{{ $index+1 }}</td>
                <td>{{ $role->name }}</td> 
            </tr>
            @endforeach
    </body>   
</table>   
 <!-- Pagination links -->
 {{ $roles->links() }}
</div>
@endsection









