<?php

namespace App\Models;
use App\User;
use Illuminate\Database\Eloquent\Model;

class Merchant extends Model
{
    protected  $fillable =['user_id', 'name', 'site_url', 'success_link', 'fail_link', 'logo', 'description','json_data','merchant_key','currency_id'];

    public function User(){
    	return $this->belongsTo(User::class);
    }
    public function Currency(){
    	return $this->belongsTo(Currency::class);
    }
}
