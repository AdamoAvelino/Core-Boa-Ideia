@extends('layouts.app')
@section('content')
<section class="container-fluid">
  <h3 class='text-center'>
      <span class="badge badge-primary mt-1">{{$statuses->count()}}</span> Statuses
  </h3>
  @include('layouts.message')
  <a href="{{url("/admin/status/create")}}" class="btn btn-success btn-sm">
    <i class="fas fa-plus-square"></i>
  </a>
  <table class="table table-bordered table-sm table-hover table-striped mt-2">
    <thead>
      <tr>
        <th>Nome</th>
        <th width='18%'>Date</th>
        <th width='10%'>Ação</th>
      </tr>
    </thead>
    <tbody>
      @forelse( $statuses as $status )
      <tr>
        <td>{{$status->name}}</td>
        <td class='text-right'>
          @dateBr($status->created_at) - @hora($status->created_at)
        </td>
        <td class='text-center'>
          <a href="{{url("/admin/status/$status->id/show")}}" class="btn btn-warning btn-sm">
              <i class="fas fa-eye"></i>
          </a>
          <a href="{{url("/admin/status/$status->id/edit")}}" class="btn btn-primary btn-sm">
              <i class="fas fa-edit"></i>
          </a>
        </td>
      </tr>
      @empty
          <td colspan="4">
        <p class="alert alert-warning">
          Nenhuma Status Encontrado
        </p>
      </td>
      @endforelse
    </tbody>
  </table>
</section>

@endsection