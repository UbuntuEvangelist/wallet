<?php

namespace App\Http\Controllers;

use Auth;
use Cart;
use App\Product;
use App\Invoice;
use Illuminate\Http\Request;

class CartController extends Controller
{   
    private $phpWallet_merchant_key;
    private $phpWallet_merchant_id;
    private $phpWallet_request_url;
    private $phpWallet_request_status_url;
    private $phpWallet_merchant_currency_code;


    public function __construct(){
        $this->phpWallet_merchant_key = setting('phpwallet.merchant_key');
        $this->phpWallet_merchant_id = setting('phpwallet.merchant_id');
        $this->phpWallet_merchant_currency_code = setting('phpwallet.merchant_currency');
        $this->phpWallet_request_status_url = setting('phpwallet.merchant_request_status_url');
        $this->phpWallet_request_url = setting('phpwallet.merchant_request_url');
    }

    public function add(Request $request){
        if (!Auth::check()) {
            return view('login');
        }

    	$this->validate($request, [
    		'quantity'	=>	'required|integer|min:0',
    		'product_id'	=>	'required|exists:products,id'
    	]);

    	$userId = Auth::user()->id; // get this from session or wherever it came from
       	$product = Product::findOrFail($request->product_id);
        $id = $product->id;
        $name = $product->title;
        $price = $product->price;
        $qty = $request->quantity;
        \Cart::session($userId)->add($id, $name, $price, $qty);

        return back();
    }

    public function remove(Request $request, $itemId){
        if (!Auth::check()) {
            return view('login');
        }
        Cart::session(Auth::user()->id)->remove($itemId);
        return redirect(url('/').'/item/removed/'.$itemId);
    }

    public function checkout(Request $request){
        if (!Auth::check()) {
            return view('login');
        }

        $invoice = invoice::create([
            'user_id'   =>  Auth::user()->id
        ]);

    	//validation here
    	$data['items'] = array();
    	foreach (Cart::session(Auth::user()->id)->getContent()  as $cartItem) {
    		$item['name'] = $cartItem->name;
    		$item['price']	= $cartItem->price;
    		$item['qty']	=	$cartItem->quantity;
    		$item['description']	=	$cartItem->description;

            array_push($data['items'], $item);
    	}

        $data['invoice_id'] = $invoice->id;

        $data['invoice_description'] = "Order with Invoice ".  $data['invoice_id'] ;
        $data['total'] = Cart::session(Auth::user()->id)->getTotal();
        $data['return_url'] = url('pay/success/?');
        $data['cancel_url'] = url('pay/cancel');
        $encodeddata = json_encode($data);


        $post = array(
        'merchant_key'=> $this->phpWallet_merchant_key,
        'invoice'=> $encodeddata,
        'currency_code' =>  $this->phpWallet_merchant_currency_code
        );

        

        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $this->phpWallet_request_url );
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $post);

        $response = json_decode(curl_exec($ch),true);

        curl_close($ch);

        // var_dump($response);

        if ($response['status'] == true) {
            //dd($response['link']);

            return redirect()->to($response['link']);
           //header('Location: '.$response['link'].'');
        }else{
            echo "string";
            var_dump($response);
        }
    }

    public function success(Request $request){

        if ($request->get('token')) {
        
            $post = array(
            'merchant_key'=> $this->phpWallet_merchant_key,
            'token'=> $request->get('token')
            );


            $ch = curl_init();
            curl_setopt($ch, CURLOPT_URL, $this->phpWallet_request_status_url);
            curl_setopt($ch, CURLOPT_POST, true);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($ch, CURLOPT_POSTFIELDS, $post);

            var_dump(curl_exec($ch));
            $response = json_decode(curl_exec($ch),true);

            curl_close($ch);

            if ($response['status'] == true) {

                if ($response['data']['entity_id'] == $this->phpWallet_merchant_id) {
                   
                    //dd($response['link']);
                    //var_dump($response);
                   //header('Location: '.$response['link'].'');
                    $invoice = Invoice::findOrFail((int)json_decode($response['data']['json_data'])->invoice_id);
                    $invoice->json_data = $response['data']['json_data'];
                    $invoice->is_paid = 1;
                    $invoice->save();

                    return redirect(url('/').'/invoice/'.$invoice->id);
                }else{
                    dd('invalid_merchant_id');
                }
            }else{
                echo "string";
                var_dump($response);
            }
        }
    }

    public function show_invoice(Request $request, $invoice_id){
        $invoice = Invoice::findOrFail($invoice_id);

        if ($invoice->user_id == Auth::user()->id) {
            return view('templates.invoice')
            ->with('page', 'Invoice')
            ->with('invoice', $invoice);
        }
    }

    public function show_orders(Request $request){
        
        $invoices = Invoice::where('user_id', Auth::user()->id)->where('is_paid', '1')->orderby('id', 'desc')->paginate(10);


            return view('templates.orders')
             ->with('page', 'Orders')
            ->with('invoices', $invoices);
    }
}
