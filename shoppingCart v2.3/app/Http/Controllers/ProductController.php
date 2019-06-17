<?php
namespace App\Http\Controllers;

use Auth;
use Cart;
use App\Product;
use App\Invoice;
use Illuminate\Http\Request;

class ProductController extends Controller{

	public function Show(Request $request, $slug, $id){
		$product = \App\Product::with('Categorie')->findOrFail($id);
		$related = \App\Product::where('subcategorie_id', $product->subcategorie_id)->where('id','!=',$product->id)->paginate(4);
		return view('product')
		->with('product', $product)
		->with('page', 'Item')
		->with('subpage', $product->title)
		->with('related', $related);
	}
}