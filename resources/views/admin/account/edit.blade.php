@extends('layouts.app')
@section('content')
  <section class="container">
    <form class="form-group" method='post' action='{{route("admin.account.delete", $account->id)}}' id='delete'>
        {{ csrf_field() }}
        {{ method_field('DELETE') }}
    </form>

    <form class="form-group" method='post' action='{{ route("admin.account.update", $account->id)}}'>
      <fieldset class='position-relative shadow mt-5 px-3 py-2 border border-primary rounded'>
        <legend class='form-legend d-inline position-absolute' style='width:60%'>
          <span class='p-2 bg-primary text-white shadow rounded'>Editar Conta</span>
        </legend>
        {{ csrf_field() }}
        {{ method_field('PUT') }}

        @include('admin.account.formulario')

        <div class="row" style='margin-top: 10px'>
          <div class="col-md-8">
            <button class='btn btn-success btn-sm'>
                <i class="fas fa-save"></i>
            </button>
            <button class='btn btn-danger btn-sm' form='delete'>
                <i class="fas fa-trash"></i>
            </button>
          </div>
        </div>
      </fieldset>
    </form>
  </section>
@endsection