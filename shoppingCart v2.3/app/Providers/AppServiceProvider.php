<?php

namespace App\Providers;

use Illuminate\Support\Facades\Schema;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
         Schema::defaultStringLength(191);
           view()->composer('*', function($view){
            
            $with = array_merge([
                'categories' => \App\Categorie::with('Subcategories')->get(),
                'page' => false,
                'subpage'   =>  false
            ], $view->getData());
            
            $view->with($with);
        });
    }

    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }
}
