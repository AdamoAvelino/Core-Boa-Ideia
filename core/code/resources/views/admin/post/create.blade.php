@extends('layouts.app')
@section('content')
    <section class="container">
        <form class="form-group" enctype="multipart/form-data" method='post' action="{{ route('admin.post.save') }}">
            <fieldset class='position-relative shadow mt-5 py-2 px-3 border border-primary rounded'>
                <legend class='form-legend d-inline position-absolute' style='width:60%'>
                    <span class='p-2 bg-primary text-white shadow rounded'>Criar Post</span>
                </legend>
                {{ csrf_field() }}
                <input type="hidden" name="user_id" value="{{ auth()->user()->id }}">
                @include('admin.post.formulario')
                <div class="row" style='margin-top: 10px'>
                    <div class="col-md-8">
                        <button class='btn btn-success btn-sm'>
                            <i class="fas fa-save"></i>
                        </button>
                    </div>
                </div>
            </fieldset>
        </form>
    </section>
@endsection