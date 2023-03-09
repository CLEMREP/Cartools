<?php

namespace App\Repositories;

use App\Models\User;
use Illuminate\Database\Eloquent\Collection;

class UserRepository
{
    public function __construct(
        private readonly User $model
    ) {
    }

    public function all(): Collection
    {
        return $this->model->all();
    }

    public function create(array $data): User
    {
        return $this->model->create($data);
    }

    public function checkEmail(string $email): User|null
    {
        return $this->model->where('email', $email)->first();
    }
}
