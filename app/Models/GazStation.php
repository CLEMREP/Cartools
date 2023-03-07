<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class GazStation extends Model
{
    use HasFactory;

    protected $guarded = [];

    protected $hidden = ['id', 'created_at', 'updated_at'];

    public function prices(): HasMany
    {
        return $this->hasMany(Price::class, 'gaz_station_id', 'id');
    }
}
