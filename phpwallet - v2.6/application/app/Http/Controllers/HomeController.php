<?php

namespace App\Http\Controllers;

use Auth;
use App\User;
use App\Models\Transactions;
use App\Models\Currrency;
use Illuminate\Http\Request;
use TCG\Voyager\Models\Page;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth', ['except' => ['getPage']]);
    }

    public function getPage(Request $request, $id){
        
        $page = Page::where('id', $id)->first();

        if ($page != null) {
            return view('page.show')->with('page', $page);
        }

        return abort(404);
    }

    public function accountStatus(Request $request, $user){
        $user = User::findOrFail($user);
        $user->account_status = 0;
        $user->save();
        return back();
    }
    public function locale(Request $request, $locale){
        
        dd($locale);
        App::setLocale($locale);
        return view('welcome');
    }
    
    public function wallet(Request $request, $id){

        $currency = Auth::user()->walletByCurrencyId($id);
        if ($currency) {
            
            Auth::user()->currency_id = $id;
            Auth::user()->save();
        }
        return back();
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $transactions = Auth::user()->RecentActivity()->with('Status')->orderby('id','desc')->where('transaction_state_id', '!=', 3)->paginate(10);
       

        $transactionsToConfirm =  Auth::user()->RecentActivity()->with('Status')->orderby('id','desc')->where('transaction_state_id', 3)->where('money_flow' , '!=', '+')->paginate(10);

        return view('home.index')
        ->with('transactions', $transactions)
        ->with('transactions_to_confirm', $transactionsToConfirm);
    }
}
 