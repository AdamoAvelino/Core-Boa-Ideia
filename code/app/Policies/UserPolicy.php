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
    public function view(User $user)
    {
        return $user->hasPermission($user->roles, 'user_view');
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
    public function viewUserCoordenador(User $user, User $userAutenticado)
    {
        
        $coordenador = $user->hasPermission($user->roles, 'user_view_coordenador');
        $rolePermission = true;
        $producePermission = true;

        if ($userAutenticado) {
            $rolePermission = false;
            $producePermission = false;
            
            
            $rolePermission = $userAutenticado->roles->contains(function ($value, $key) {
                return in_array($value->id, [1, 2, 3]);
            });
            
            $producePermission = $this->producePermission($user, $userAutenticado);
        }

        return $coordenador and $rolePermission and $producePermission;
    }
    /**
     * ----------------------------------------------------------------------------------
     */
    public function viewUserAdmin(User $user, User $userAutenticado)
    {
        $permissionAdmin = $user->hasPermission($user->roles, 'user_view_admin');
        $producePermission = $this->producePermission($user, $userAutenticado);
        return $permissionAdmin and $producePermission;
    }
    /**
     * ----------------------------------------------------------------------------------
     */
    public function viewUserSelf(User $user, User $userAutenticado)
    {
        // $viewPerfil = $user->hasPermission($user->roles, 'user_view_self');
        return $user->id == $userAutenticado->id;
    }
    /**
     * ----------------------------------------------------------------------------------
     * Apenas usuários donos de deu perfíl podem inativar perfíl
     */
    public function updateActive(User $user, User $userAutenticado)
    {
        return $user->id == $userAutenticado->id;
    }

    /**
     * --------------------------------------------------------------------------------
     *
     * @param \App\User $user
     * @return mixed
     */
    public function create(User $user)
    {
        // dd($user->roles);
        return $user->hasPermission($user->roles, 'user_create');
    }

    /**
     * ----------------------------------------------------------------------------------
     */
    public function includeProduces(User $user)
    {
        return $user->hasManyRules('Admin') or $user->hasManyRules('Coordenador');
    }

    /**
     * ----------------------------------------------------------------------------------
     * Determine whether the user can update the model.
     *
     * @param \App\User $user
     * @param \App\User $userAutenticado
     * @return mixed
     */
    public function update(User $user, User $userAutenticado)
    {
        return $user->hasPermission($user->roles, 'user_edit') and $this->getRule($user, $userAutenticado);
    }

    /**
     * ----------------------------------------------------------------------------------
     * Determine whether the user can delete the model.
     *
     * @param \App\User $user
     * @param \App\User $userAutenticado
     * @return mixed
     */
    public function delete(User $user, User $userAutenticado)
    {
        return $user->hasPermission($user->roles, 'user_delete') and $this->getRule($user, $userAutenticado);
    }

    /**
     * ----------------------------------------------------------------------------------
     * @param User $user
     * @param $ability
     * @return bool
     */
    public function before(User $user, $ability)
    {
        if ($user->hasManyRules('Root')) {
            return true;
        }
    }

    private function producePermission($user, $userAutenticado)
    {
        $produtorasUser = $user->produces->map(function ($produtora) {
            return $produtora->id;
        });

        $producePermission = $userAutenticado->produces->contains(function ($value, $key) use ($produtorasUser) {
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
    private function getRule(User $user, User $userAutenticado)
    {
        $retorno = false;

        if ($user->hasManyRules('Revisor') or $user->hasManyRules('Editor')) {
            $retorno = $user->id == $userAutenticado->id;
        }

        if ($user->hasManyRules('Admin') or $user->hasManyRules('Coordenador')) {
            $retorno = $user->hasProduces($userAutenticado->produces);
        }

        return $retorno;
    }
}
