<?php

namespace App\Policies;

use App\User;
use Illuminate\Auth\Access\HandlesAuthorization;

class UserPolicy
{
    use HandlesAuthorization;

    /**
     * Determine whether the user can view the model.
     *
     * @param \App\User $user
     * @return mixed
     */
    public function view(User $autenticado)
    {
        return $autenticado->hasPermission($autenticado->roles, 'user_view');
    }
    /**
     * ----------------------------------------------------------------------------------
     */
    // public function anyView(User $user, User $userAutenticado)
    // {
    //     // return $user->hasPermission($user->roles, 'user_view') and $this->getRule($user, $userAutenticado);
    //     return $user->hasPermission($user->roles, 'user_view_any');
    // }
    /**
     * ----------------------------------------------------------------------------------
     */
    public function viewUserCoordenador(User $autenticado, User $user)
    {
        
        $coordenador = $autenticado->hasPermission($autenticado->roles, 'user_view_coordenador');
        $rolePermission = true;
        $producePermission = true;

        if ($user) {
            $rolePermission = false;
            $producePermission = false;
            
            
            $rolePermission = $user->roles->contains(function ($value, $key) {
                return in_array($value->id, [1, 2, 3]);
            });
            
            $producePermission = $this->producePermission($user, $user);
        }

        return $coordenador and $rolePermission and $producePermission;
    }
    /**
     * ----------------------------------------------------------------------------------
     */
    public function viewUserAdmin(User $autenticado, User $user)
    {
        $permissionAdmin = $autenticado->hasPermission($autenticado->roles, 'user_view_admin');
        $producePermission = $this->producePermission($autenticado, $user);
        return $permissionAdmin and $producePermission;
    }
    /**
     * ----------------------------------------------------------------------------------
     */
    public function viewUserSelf(User $autenticado, User $user)
    {
        // $viewPerfil = $user->hasPermission($user->roles, 'user_view_self');
        return $autenticado->id == $user->id;
    }
    /**
     * ----------------------------------------------------------------------------------
     * Apenas usuários donos de deu perfíl podem inativar perfíl
     */
    public function updateActive(User $autenticado, User $user)
    {
        
        return $autenticado->id == $user->id;
    }

    /**
     * --------------------------------------------------------------------------------
     *
     * @param \App\User $user
     * @return mixed
     */
    public function create(User $autenticado)
    {
        // dd($autenticado->roles);
        return $autenticado->hasPermission($autenticado->roles, 'user_create');
    }

    /**
     * ----------------------------------------------------------------------------------
     */
    public function includeProduces(User $autenticado)
    {
        return $autenticado->hasManyRoles('Admin') or $autenticado->hasManyRoles('Coordenador');
    }

    /**
     * ----------------------------------------------------------------------------------
     * Determine whether the user can update the model.
     *
     * @param \App\User $user
     * @param \App\User $userAutenticado
     * @return mixed
     */
    public function update(User $autenticado, User $user)
    {
        return $autenticado->hasPermission($autenticado->roles, 'user_edit') and 
            $this->getRule($autenticado, $user);
    }

    /**
     * ----------------------------------------------------------------------------------
     * Determine whether the user can delete the model.
     *
     * @param \App\User $user
     * @param \App\User $userAutenticado
     * @return mixed
     */
    public function delete(User $autenticado, User $user)
    {
        return $autenticado->hasPermission($autenticado->roles, 'user_delete') and 
        $this->getRule($autenticado, $user);
    }

    /**
     * ----------------------------------------------------------------------------------
     * @param User $user
     * @param $ability
     * @return bool
     */
    public function before(User $user, $ability)
    {
        if ($user->hasManyRoles('Root')) {
            return true;
        }
    }

    private function producePermission($autenticado, $user)
    {
        $produtorasUser = $autenticado->produces->map(function ($produtora) {
            return $produtora->id;
        });

        $producePermission = $user->produces->contains(function ($value, $key) use ($produtorasUser) {
            return in_array($value->id, $produtorasUser->toArray());
        });

        return $producePermission;
    }

    /**
     * ----------------------------------------------------------------------------------
     * @param User $user
     * @param User $userAutenticado
     * @return bool
     */
    private function getRule(User $autenticado, User $user)
    {
        $retorno = false;

        if ($autenticado->hasManyRoles('Revisor') or $autenticado->hasManyRoles('Editor')) {
            $retorno = $autenticado->id == $user->id;
        }

        if ($autenticado->hasManyRoles('Admin') or $autenticado->hasManyRoles('Coordenador')) {
            $retorno = $autenticado->hasProduces($user->produces);
        }

        return $retorno;
    }
}
