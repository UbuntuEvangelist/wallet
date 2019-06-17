<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
       
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $categories = \App\Categorie::with('Subcategories')->get();
        $products = \App\Product::with('Categorie')->orderBy('id', 'desc')->paginate(12);
        return view('home')
        ->with('products', $products)
        ->with('page', 'Shop')
        ->with('categories', $categories);
    }

    public function show_categorie($categorie_id, $name = null)
    {
        $categories = \App\Categorie::with('Subcategories')->get();
        $category = \App\Categorie::where('id', $categorie_id)->first();
        $products = \App\Product::with('Categorie')->where('categorie_id', $categorie_id)->orderBy('id', 'desc')->paginate(12);
        return view('home')
        ->with('products', $products)
        ->with('page', $category->name)
        ->with('categories', $categories);
    }
    public function show_subcategorie($categorie_id, $name = null,$subcategorie_id, $sub_name = null)
    {
        $categories = \App\Categorie::with('Subcategories')->get();
        $category = \App\Categorie::where('id', $categorie_id)->first();
        $subcategorie = \App\Subcategorie::where('id', $subcategorie_id)->first();
        $products = \App\Product::with('Categorie')->where('subcategorie_id', $subcategorie_id)->orderBy('id', 'desc')->paginate(12);
        return view('home')
        ->with('products', $products)
        ->with('page', $category->name)
        ->with('subpage',$subcategorie->name )
        ->with('categories', $categories);
    }
}
