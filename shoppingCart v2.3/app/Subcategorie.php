<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Subcategorie extends Model
{
    public function Categorie(){
    	return $this->belogsTo(Categorie::class);
    }
}
