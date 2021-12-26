<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Category extends Model
{
    protected $guarded = ['id'];
    use HasFactory;
    use SoftDeletes;

    public function books()
    {
        return $this->belongsToMany(Book::class);
    }
}
