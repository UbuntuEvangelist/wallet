<?php

namespace App\Http\Controllers;

use Auth;
use App\Models\Voucher;
use PayPal;
use App\Models\Wallet;
use App\Models\Currency;
use Illuminate\Http\Request;


class PayPalController extends Controller
{
	protected $provider; 

	public function __construct()
    {
       $this->provider = PayPal::setProvider('express_checkout'); 
    }

    public function sendRequestToPaypal(Request $request){

        $this->validate($request,[
            'quantity'  =>  'required|integer|min:1',
        ]);
        $total = $request->quantity*5;
      	
      	$data['items'] = [
            [
                'name' => 'Voucher',
                'price' => $this->Money($request->quantity*5),
                'qty' => 1
            ]
        ];

        $data['invoice_id'] = time();
        $data['invoice_description'] = "Order ".time()." Invoice";

        $data['return_url'] = url('pay/voucher/success');
        $data['cancel_url'] = url('pay/voucher/cancel');

        // $total = 0;
        // foreach($data['items'] as $item) {
        //     $total += $item['price']*$item['qty'];
        // }

        $data['total'] = $this->Money($total);

        $response = $this->provider->setExpressCheckout($data);
        session()->put(['cart' => $data ]);

        return redirect($response['paypal_link']);
    }

    public function payVoucherSuccess(Request $request){
    	if ($request->get('PayerID') and $request->get('token')) {

    			
    			$token = $request->get('token');
	    		
	    		$PayerID = $request->get('PayerID');
		    	
		    	$response = $this->provider->getExpressCheckoutDetails($token);
		    
	    		if (in_array(strtoupper($response['ACK']), ['SUCCESS', 'SUCCESSWITHWARNING'])) {
	    			
		            // Perform transaction on PayPal
		            
		            $payment_status = $this->provider->doExpressCheckoutPayment(session()->get('cart'), $token, $PayerID);
		            
		            $status = $payment_status['PAYMENTINFO_0_PAYMENTSTATUS'];
		          
		           if ($status == 'Completed') {
		           	
		           		$fee = (float)$payment_status['PAYMENTINFO_0_FEEAMT'] ;
		           		$wallet = Auth::user()->currentWallet() ;
		           		$voucherValue = (float)$payment_status['PAYMENTINFO_0_AMT'] - (float)$payment_status['PAYMENTINFO_0_FEEAMT'];

		           		$voucher = Voucher::create([
				            'user_id'   =>  Auth::user()->id,
				            'voucher_amount'    =>  $payment_status['PAYMENTINFO_0_AMT'],
				            'voucher_fee'   =>  $fee,
				            'voucher_value' =>  $voucherValue,
				            'voucher_code'  =>  Auth::user()->id.str_random(4).time().str_random(4),
				            'currency_id'   =>  $wallet->currency->id,
				            'currency_symbol'   =>  $wallet->currency->symbol,
				            'wallet_id' =>  $wallet->id
				        ]);

				        $wallet->amount = $wallet->amount + $voucherValue ;

				    	$voucher->user_loader = Auth::user()->id;
				    	
				    	$voucher->is_loaded = 1 ;

				    	$voucher->save();

				    	$wallet->save();

				        Auth::user()->RecentActivity()->save($voucher->Transactions()->create([
				            'user_id' =>  Auth::user()->id,
				            'entity_id'   =>  $voucher->id,
				            'entity_name' =>  $wallet->currency->name,
				            'transaction_state_id'  =>  1, // waiting confirmation
				            'money_flow'    => '+',
				            'activity_title'    =>  'Voucher Load',
				            'currency_id' =>  $voucher->currency_id,
				            'currency_symbol' =>  $voucher->currency_symbol,
				            'gross' =>  $payment_status['PAYMENTINFO_0_AMT'],
				            'fee'   =>  $fee,
				            'net'   =>  $voucherValue,
				            'balance'	=>	$wallet->amount,
				        ]));

		           }

		           	session()->forget('cart');
		            return redirect('/home');

	        	}
    			
    	} 
    }

    private function Money($value){
    	return number_format((float)$value, 2, '.', '');
    }


}