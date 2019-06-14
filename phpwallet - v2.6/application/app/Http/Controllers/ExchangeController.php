<?php

namespace App\Http\Controllers;

use Auth;
use App\User;
use App\Models\Currency;
use App\Models\Exchange;
use App\Models\CurrencyExchangeRate;
use App\Models\Wallet;
use App\Models\Transaction;
use Illuminate\Http\Request;

class ExchangeController extends Controller
{


    public function getExchangeRequestForm(Request $request, $currency_id = null, $second_currency_id = null ){


        
        
        $firstCurrency = Currency::find(Auth::user()->currency_id);

        $secondCurrenciesExchanges = CurrencyExchangeRate::with('secondCurrency')->where('first_currency_id', $firstCurrency->id)->get();

        if (count($secondCurrenciesExchanges) == 0) {
            dd('Please Contact the site admin to add currency exchange rates for '.$firstCurrency->name.' currency');
        }

        $firstCurrenciesExchages = CurrencyExchangeRate::with('firstCurrency')->select('first_currency_id')->distinct()->get();

        if (count($firstCurrenciesExchages) == 0 ) {
            dd('Please Contact the site admin to add currency exchange rates ');
        }


        if (is_null($second_currency_id) or !($second_currency_id)) {
            $secondCurrency = $secondCurrenciesExchanges[0]->secondCurrency;
        }else{
            $secondCurrency = Currency::find($second_currency_id);
        }

        if ($firstCurrency->id == $secondCurrency->id) {
            return back();
        }

        if ($secondCurrency == null) {
            return back();
        }

        //Auth::user()->currency_id = $firstCurrency->id;
        //Auth::user()->save();
        
        if ( $secondCurrency->id == Auth::user()->currency_id) {
             $currency = Auth::user()->walletByCurrencyId($firstCurrency->id);
                if ($currency) {
                    Auth::user()->currency_id = $firstCurrency->id;
                    Auth::user()->save();
                }
            return redirect($request->url());
        } else {

            $wallet = Wallet::with('Currency')->where('user_id', Auth::user()->id)->where('currency_id',$secondCurrency->id)->first();

            if ($wallet == null) {
                $wallet = Auth::user()->newWallet($secondCurrency->id);
            }
        }

        $exchange = CurrencyExchangeRate::where('first_currency_id', $firstCurrency->id)->where('second_currency_id', $secondCurrency->id)->first();

        return view('exchange.exchangeRequestForm')
        ->with('wallet',$wallet)
        ->with('exchange', $exchange)
        ->with('secondCurrency',$secondCurrency)
        ->with('firstCurrency',$firstCurrency)
        ->with('secondCurrenciesExchanges',$secondCurrenciesExchanges)
        ->with('firstCurrenciesExchages',$firstCurrenciesExchages);
    }

    public function exchange(Request $request){
        $this->validate($request, [
            'amount'    =>  'required|numeric|between:1,'.Auth::user()->currentWallet()->amount,
            'exchange_id'   =>  'required|exists:currency_exchange_rates,id'
        ]);

        if ( Auth::user()->account_status == 0 ) {
            flash(__('Your account is under a withdrawal request review proccess. Please wait until your request is complete in a few minutes to continue with your activities.') , 'info');
             return  back();
        }

        $currencyexchange = CurrencyExchangeRate::with('firstCurrency','secondCurrency')->find($request->exchange_id);

        $firstWallet = Wallet::where('currency_id', $currencyexchange->firstCurrency->id)->where('user_id', Auth::user()->id)->first();

        $secondWallet = Wallet::where('currency_id', $currencyexchange->secondCurrency->id)->where('user_id', Auth::user()->id)->first();

        $firstWallet->amount = $firstWallet->amount - ($request->amount);

        $secondWallet->amount = $secondWallet->amount + ( $request->amount * $currencyexchange->exchanges_to_second_currency_value );

        $firstWallet->save();
        $secondWallet->save();

        $exchange = Exchange::create([
            'user_id'   =>  Auth::user()->id,
            'first_currency_id' =>   $currencyexchange->firstCurrency->id,
            'second_currency_id'    =>  $currencyexchange->secondCurrency->id,
            'gross' =>  $request->amount,
            'fee'   =>  0.00,
            'net'   =>  $request->amount,

        ]);

        Auth::User()->RecentActivity()->save($exchange->Transactions()->create([
            'user_id' => Auth::User()->id,
            'entity_id'   =>  $exchange->id,
            'entity_name' =>   $currencyexchange->firstCurrency->name,
            'transaction_state_id'  =>  1, // waiting confirmation
            'money_flow'    => '-',
            'currency_id' =>  $currencyexchange->firstCurrency->id,
            'currency_symbol' =>  $currencyexchange->firstCurrency->symbol,
            'activity_title'    =>  'Currency Exchange',
            'gross' =>  $exchange->gross,
            'fee'   =>  $exchange->fee,
            'net'   =>  $exchange->net,
            'balance'   =>  $firstWallet->amount
        ]));

        Auth::User()->RecentActivity()->save($exchange->Transactions()->create([
            'user_id' => Auth::User()->id,
            'entity_id'   =>  $exchange->id,
            'entity_name' =>   $currencyexchange->secondCurrency->name,
            'transaction_state_id'  =>  1, // waiting confirmation
            'money_flow'    => '+',
            'currency_id' =>  $currencyexchange->secondCurrency->id,
            'currency_symbol' =>  $currencyexchange->secondCurrency->symbol,
            'activity_title'    =>  'Currency Exchange',
            'gross' =>  $request->amount * $currencyexchange->exchanges_to_second_currency_value,
            'fee'   =>  $exchange->fee,
            'net'   =>  $request->amount * $currencyexchange->exchanges_to_second_currency_value,
            'balance'   =>  $secondWallet->amount
        ]));

        return redirect('home');


    }
}
