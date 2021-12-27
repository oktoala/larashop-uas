<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BookOrder extends Model
{
    protected $guarded = ['id'];
    protected $table = 'book_order';
    use HasFactory;
}
