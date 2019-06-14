<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Currency extends Model
{

	public function DepositMethods(){
		return $this->belongsToMany(\App\Models\DepositMethod::class, 'currency_deposit_methods');
	}

	public function WithdrawalMethods(){
		return $this->belongsToMany(\App\Models\WithdrawalMethod::class, 'currency_withdrawal_methods');
	}
}