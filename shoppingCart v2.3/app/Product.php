<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
   protected $fillable = ['description','thumbnailurl','thumbnail','title','price','categorie_id','preview1_url','preview2_url','preview3_url','preview4_url','preview5_url'];

   public function Categorie(){
   	return $this->belongsTo(Categorie::class);
   }

  
}
