<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class CurrencyExchangeRate extends Model
{
	public function firstCurrency(){

		return $this->belongsTo(Currency::class, 'first_currency_id');

	}

	public function secondCurrency(){

		return $this->belongsTo(Currency::class, 'second_currency_id');

	}

}