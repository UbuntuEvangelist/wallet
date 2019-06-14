<?php

namespace App\Models;
use App\User;

use Illuminate\Database\Eloquent\Model;

class Transaction extends Model
{	
	protected $table = 'transactionable';
    //protected $with = ['Status'];
    
    protected $fillable = [
        'user_id',
        'entity_id',
        'entity_name',
        'currency',
        'balance',
        'activity_title',
        'money_flow',
        'transaction_state_id',
        'request_id',
        'gross',
        'fee',
        'net',
        'json_data',
        'currency_id',
        'currency_symbol'];


    public function Transactionable(){
    	return $this->morph();
    }

    public function Status(){
        return $this->hasOne(\App\Models\TransactionState::class, 'id', 'transaction_state_id');
    }

    public function User(){
    	return $this->belongsTo(\App\User::class);
    }

    public function gross(){
        return $this->money_flow .' '. number_format((float)$this->gross, 2, '.', ',') .' '.  $this->currency_symbol;
    } 


    public function fee(){
        if ($this->fee > 0) {
            return  '- ' . number_format((float)$this->fee, 2, '.', ',') .' '. $this->currency_symbol;
        }
        return number_format((float)$this->fee, 2, '.', ',') . ' '. $this->currency_symbol;
    }

    public function net(){
         return $this->money_flow .' '. number_format((float)$this->net, 2, '.', ',') . ' '. $this->currency_symbol;
    }

    public function balance(){
        return number_format((float)$this->balance, 2, '.', ',') . ' '. $this->currency_symbol;
    }

    
}
