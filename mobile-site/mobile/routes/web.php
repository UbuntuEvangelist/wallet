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

Route::get('/lang/{lang}', function ($locale){
	Session::put('locale', $locale);
       return redirect('/');
});

Route::get('/wallet/{id}','HomeController@wallet')->middleware('auth');    
 
Route::get('*', function(){

        App::setLocale(session()->get('locale'));
});
/*Route::get('/', function () {
    return view('welcome');
});*/
Route::get('/', function () {
    return redirect(route('home'));
})->middleware('auth');


Route::get('/account_status/{User}', 'HomeController@accountStatus')->middleware('auth');

//Auth::routes();

// Authentication Routes...
Route::get('login', 'Auth\LoginController@showLoginForm')->name('login');
Route::post('login', 'Auth\LoginController@login');
Route::post('logout', 'Auth\LoginController@logout')->name('logout');

// Registration Routes...
Route::get('register', 'Auth\RegisterController@showRegistrationForm')->name('register');
Route::post('register', 'SignUpController@register');


// Password Reset Routes...
Route::get('password/reset', 'Auth\ForgotPasswordController@showLinkRequestForm')->name('password.request');
Route::post('password/email', 'Auth\ForgotPasswordController@sendResetLinkEmail')->name('password.email');
Route::get('password/reset/{token}', 'Auth\ResetPasswordController@showResetForm')->name('password.reset');
Route::post('password/reset', 'Auth\ResetPasswordController@reset');

//Account Activation Routes...
Route::get('register/{email}/{token}', 'SignUpController@verifyEmail');
Route::get('resend/activationlink', 'SignUpController@resendActivactionLink')->middleware('auth');


Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});


Route::get('/sendmoney', 'MoneyTransferController@sendMoneyForm')->name('sendMoneyForm')->middleware('auth');
Route::post('/sendmoney', 'MoneyTransferController@sendMoney')->name('sendMoney')->middleware('auth');

Route::post('/sendMoneyConfirm', 'MoneyTransferController@sendMoneyConfirm')->name('sendMoneyConfirm')->middleware('auth');
Route::post('/sendMoneyDelete', 'MoneyTransferController@sendMoneyCancel')->name('sendMoneyDelete')->middleware('auth');

Route::get('/home', 'HomeController@index')->name('home')->middleware('auth');


/*	MERCHANT ROUTES	*/

Route::get('/merchant/storefront/{ref}', 'MerchantController@getStoreFront')->name('storefront');
Route::get('/merchant/{merchant}/docs', 'MerchantController@integration')->middleware('auth');
Route::get('/mymerchants', 'MerchantController@index')->name('mymerchants')->middleware('auth');

Route::get('/merchant/new', 'MerchantController@new')->name('merchant.new')->middleware('auth');
Route::post('/merchant/add','MerchantController@add')->name('merchant.add')->middleware('auth');


/*	IPN ROUTES	*/
Route::post('/purchase/link', 'RequestController@storeRequest')->name('purchase_link');
Route::post('/request/status', 'RequestController@requestStatus')->name('purchase_status');
Route::post('/purchase/confirm', 'IPNController@purchaseConfirmation')->name('purchaseConfirm')->middleware('auth');
Route::post('/ipn/payment', 'IPNController@pay')->name('pay')->middleware('auth');
Route::post('/ipn/payment/guest', 'IPNController@logandpay')->name('logandpay');

/*	ADD CREDIT ROUTES	*/
Route::get('/addcredit/{method_id?}', 'AddCreditController@addCreditForm')->name('add.credit')->middleware(['auth','activeUser']);
Route::post('/addcredit', 'AddCreditController@depositRequest')->name('post.credit')->middleware('auth');

/*	DEPOSITS ROUTES	*/
Route::get('/mydeposits','DepositController@myDeposits')->name('mydeposits')->middleware('auth');
Route::put('/confirm/deposit','DepositController@confirmDeposit')->name('confirm.deposit')->middleware('auth');

/* WITHDRAWAL ROUTES */

route::get('/withdrawal/request/{method_id?}', 'WithdrawalController@getWithdrawalRequestForm')->name('withdrawal.form')->middleware(['auth','activeUser']);
route::post('/withdrawal/request', 'WithdrawalController@makeRequest')->name('post.withdrawal')->middleware('auth');
route::get('/withdrawals', 'WithdrawalController@index')->name('withdrawal.index')->middleware('auth');

Route::put('/confirm/withdrawal','WithdrawalController@confirmWithdrawal')->name('confirm.withdrawal')->middleware('auth');

/* EXCHANGE ROUTES */
route::get('/exchange/first/{first_id?}/second/{second_id?}', 'ExchangeController@getExchangeRequestForm')->name('exchange.form')->middleware('auth');
route::post('/exchange/', 'ExchangeController@exchange')->name('post.exchange')->middleware('auth');

route::get('new_ticket', 'TicketsController@create')->name('support');
route::post('new_ticket', 'TicketsController@store')->name('support');
route::get('my_tickets', 'TicketsController@userTickets')->name('support');
Route::get('tickets/{ticket_id}', 'TicketsController@show')->name('support');
Route::post('comment', 'TicketCommentsController@postTicketComment')->name('support');

Route::group(['prefix' => 'ticketadmin', 'middleware' => 'ticketadmin'], function() {
    Route::get('tickets', 'TicketsController@index')->name('support');
    Route::post('close_ticket/{ticket_id}', 'TicketsController@close')->name('support');
});

route::get('profile/info', 'ProfileController@personalInfo')->name('profile.info')->middleware('auth');
route::post('profile/info', 'ProfileController@storePersonalInfo')->name('profile.info.store')->middleware('auth');
route::get('profile/identity', 'ProfileController@profileIdentity')->name('profile.identity')->middleware('auth');
route::post('profile/identity', 'ProfileController@storeProfileIdentity')->name('profile.identity.store')->middleware('auth');
route::get('profile/newpassword', 'ProfileController@newpasswordInfo')->name('profile.newpassword')->middleware('auth');
route::post('profile/newpassword', 'ProfileController@storeNewpasswordInfo')->name('profile.newpassword.store')->middleware('auth');

//PAGES ROUTES
route::get('page/{id}', "HomeController@getPage");


//VOUCHERS ROUTES
route::get('my_vouchers', 'VoucherController@getVouchers')->name('my_vouchers')->middleware('auth');
route::post('my_vouchers', 'VoucherController@createVoucher')->name('create_my_voucher')->middleware('auth');
route::post('load_my_voucher', 'VoucherController@loadVoucher')->name('load_my_voucher')->middleware('auth');
route::get('makevouchers', 'VoucherController@generateVoucher')->name('makeVouchers')->middleware('auth');
route::post('generateVoucher', 'VoucherController@postGenerateVoucher')->name('generateVoucher')->middleware('auth');
