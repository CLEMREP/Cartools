<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Price extends Model
{
    use HasFactory;

    public $timestamps = false;

    protected $guarded = [];

    protected $hidden = ['id', 'created_at', 'updated_at', 'gaz_station_id'];

    /**
     * @return BelongsTo<GazStation, Price>
     */
    public function gazStation(): BelongsTo
    {
        return $this->belongsTo(GazStation::class, 'id', 'gaz_station_id');
    }
}
