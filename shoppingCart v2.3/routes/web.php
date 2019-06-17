<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return redirect(route('home'));
});


Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
Route::get('/categorie/{id}/{name?}', 'HomeController@show_categorie')->name('categori');
Route::get('/categorie/{id}/{name}/{sub_id}/{sub_name}', 'HomeController@show_subcategorie')->name('categori');

Route::get('item/{slug}/{id}', 'ProductController@show');

Route::get('/checkout', function(){
	return view('checkout')->with('page', 'Checkout');
});
Route::post('/checkout', 'CartController@checkout')->middleware('auth');

Route::post('/addtocart', 'CartController@add')->middleware('auth');
Route::get('/remove/{id}', 'CartController@remove')->middleware('auth');

Route::get('/pay/success', 'CartController@success')->middleware('auth');

Route::get('/invoice/{invoice_id}', 'CartController@show_invoice')->middleware('auth');

Route::get('/orders', 'CartController@show_orders')->middleware('auth');

