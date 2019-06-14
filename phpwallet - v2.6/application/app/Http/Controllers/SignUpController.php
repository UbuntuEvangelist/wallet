<?php

namespace App\Http\Controllers;

use Auth;
use Mail;
use App\User;
use App\Models\Wallet;
use App\Models\Currency;
use Illuminate\Http\Request;
use App\Mail\verifyEmail;

class SignUpController extends Controller
{

	public function register(Request $request){
        
        
		$currency = Currency::orderBy('id','asc')->first();

		$this->validate($request, [
            'email' => 'required|unique:users,email|email|max:255',
            'name'  =>  'required|unique:users,name|alpha_dash|min:5',
            'password'  =>  'required|min:6',
            'password_confirmation'	=>	'required|same:password',
            'terms' => 'required'
        ]);

       

        $user = User::create([
            'name'  => $request->name,
            'email' =>  $request->email,
            'password'  =>  bcrypt($request->password),
            'currency_id'	=>	 $currency->id,
            'verification_token'  => str_random(40),
        ]);

        
        
        //Mail::send(new VerifyEmail($user));

        if ($user) {
        	wallet::create([
        		'user_id'	=> $user->id,
        		'amount'	=>	0,
        		'currency_id'	=> $currency->id
        	]);
        }

        if (Auth::attempt(['email' => $request->email, 'password' => $request->password])) {
            Mail::send(new VerifyEmail($user));
            return redirect('/home');
        }

        return redirect('/');
	}

    public function verifyEmail(Request $request, $email, $token){
        
        if ($email) {
           
           $user = User::where('email', $email)->where('verified', 0)->first();

           if (!is_null($user) and $user->verification_token == $token) {
               
                $user->verified = 1;
                $user->verification_token = NULL;
                $user->save();
           }

           return redirect('/');
        }
    }

    public function resendActivactionLink(Request $request){
        
        $string = str_random(40);
        
        $user = Auth::user();
        $user->verification_token = $string;
        $user->save();

        Mail::send(new VerifyEmail($user));

        flash(__('activation link succesfuly sent'), 'success');

       return back();

    }


}