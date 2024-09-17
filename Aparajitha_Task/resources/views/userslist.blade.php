@extends('layouts.app')

@section('content')
    <div class="container mt-5">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2>User List</h2>
            <a href="/usercreate" class="btn btn-primary">Add User</a>
        </div>

        <table class="table table-striped table-bordered">
    <thead class="thead-dark">
        <tr>
            <th>Sno</th>
            <th>Name</th>
            <th>Email</th>
            <th>Role</th>  
        </tr>
    </thead> 
    <tbody>
        <?php //echo "<pre>"; print_r($users); die;?>
        @foreach($users as $index => $user)
            <tr>
                <td>{{ $index+1 }}</td>
                <td>{{ $user->name }}</td>
                <td>{{ $user->email }}</td>
                <td>{{ $user->role}}</td> 
            </tr>
            @endforeach
    </body>   
</table> 
    <!-- Pagination links -->
    {{ $users->links() }}
</div>
@endsection









