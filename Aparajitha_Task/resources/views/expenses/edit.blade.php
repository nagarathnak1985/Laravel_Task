@extends('layouts.app')

@section('content')
    <div class="container mt-5">
        <h2>Edit Expense</h2>

        <form action="{{ route('expense.update', $expense->id) }}" method="POST">
            @csrf
            @method('PUT')

            <div class="row mb-3">
                            <label for="item" class="col-md-4 col-form-label text-md-end">{{ __('Item') }}</label>

                            <div class="col-md-6">
                                <input id="item" type="text" class="form-control @error('item') is-invalid @enderror" name="item" value="{{ $expense -> item }}" required autocomplete="item" autofocus>

                                @error('item')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="role" class="col-md-4 col-form-label text-md-end">{{ __('Type') }}</label>

                            <div class="col-md-6">
                                <select class="form-control" id="type" name="type" required>
                                    <option value="" disabled selected>Select Type</option>
                                    @foreach ($types as $type)                                   
                                    <option value="{{ $type }}" {{ $type == old('type', $expense->type) ? 'selected' : '' }}>
                                        {{ $type }}
                                    </option>
                                    @endforeach
                                </select> 
                                @error('type')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="amount" class="col-md-4 col-form-label text-md-end">{{ __('Amount') }}</label>

                            <div class="col-md-6">
                                <input id="amount" type="text" class="form-control @error('amount') is-invalid @enderror" name="amount" value="{{ $expense -> amount }}" required autocomplete="amount" autofocus>

                                @error('amount')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>
           
            <button type="submit" class="btn btn-primary">Update Expense</button>
        </form>
    </div>
@endsection
