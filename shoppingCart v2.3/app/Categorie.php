<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Categorie extends Model
{
    public function Subcategories (){
    	return $this->hasMany(Subcategorie::class, 'category_id');
    }
}
