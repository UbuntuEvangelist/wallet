<?php

namespace App\Http\Controllers;

use Auth;
use Image;
use App\Models\Profile;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class ProfileController extends Controller{
	
	public function personalInfo(Request $request){
		return view('profile.info');
	}

	public function storePersonalInfo(Request $request){
		
		$this->validate($request, [
            'avatar' => 'required|mimes:jpeg,jpg,png',
            'firstName'    =>  'required',
            'lastName'	=>	'required'
        ]);

		$user = Auth::user();


 		$file = $request->file('avatar');

 		$filename = hash('sha1',$file->getClientOriginalName().'-'.time()).'.'.$file->getClientOriginalExtension() ;

 		$filePath = 'users/'. Auth::user()->name.'/'.$filename;

 		$image = Image::make($file);
        $image->fit(200, 200);

        

 		if (Storage::put($filePath, (string) $image->encode())) {
 			
 			$user->avatar = $filePath;
 		
 		}else{
 			return back();
 		}

 		$user->first_name = $request->firstName;
 		$user->last_name = $request->lastName;

 		$user->save();

 		flash(__('Profile info updated with success '), 'success');
        return back();
	}

	public function newpasswordInfo(Request $request){
		return view('profile.newpassword');
	}

	public function storeNewpasswordInfo(Request $request){

		$this->validate($request, [
            'newpassword' => 'required|min:6',
            'newpasswordagain'    =>  'required|same:newpassword',
            'oldpassword'	=>	'required'
        ]);

		

        if ( password_verify($request->oldpassword, Auth::user()->password) ) {
        	$user = Auth::user();
        	$user->password = bcrypt($request->newpassword);
            $user->save();
        	flash(__('Password changed with success'), 'success');

        }else{

        	flash('The old password is incorrect. ','danger');
        }

        return back();

	}

	public function profileIdentity(Request $request){
		return view('profile.identity');
	}

	public function storeProfileIdentity(Request $request){

		$this->validate($request, [
            'document' => 'required|mimes:jpeg,jpg,png'
        ]);

        $file = $request->file('document');

 		$filename = hash('sha1',$file->getClientOriginalName().'-'.time()).'.'.$file->getClientOriginalExtension() ;
 		$filePath = 'users/'.Auth::user()->name;
 		$file->storeAs($filePath , $filename );  

        $profile = Profile::where('user_id',Auth::user()->id)->first();

        if ($profile != null ) {
        	$profile->document = $filePath .'/'.$filename ;
            $profile->save();
        }else{
        	Profile::create([
        		'user_id'	=>	Auth::user()->id,
        		'document'	=>  $filePath .'/'.$filename
        	]);
        }

        return back();

		
 		
       
	}

}