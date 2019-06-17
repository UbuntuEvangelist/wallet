<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Invoice extends Model
{
    protected $fillable = ['user_id', 'json_data', 'is_paid'];

    public function getJsonDataAttribute($value){
    	return json_decode($value);
    }
}
