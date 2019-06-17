<aside id="leftsidebar" class="sidebar">
    <div class="container">
        <div class="row clearfix">
            <div class="col-12">
                <div class="menu">
                    <ul class="list">
                        
                        <li class="header">MAIN</li>
                       
                         @foreach($categories as $categorie)
                        <li>
                            <a href="{{url('/')}}/categorie/{{$categorie->id}}/{{$categorie->name}}" class="menu-toggle waves-effect waves-block">{{$categorie->name}}</a>
                            @if(count($categorie->subcategories))
                            <ul class="ml-menu">
                                @foreach($categorie->subcategories as $subcategory)
                                <li><a href="{{url('/')}}/categorie/{{$categorie->id}}/{{$categorie->name}}/{{$subcategory->id}}/{{$subcategory->name}}" class=" waves-effect waves-block">{{$subcategory->name}}</a></li>
                                @endforeach
                            </ul>
                            @endif
                        </li>
                        @endforeach
                         
                    </ul>
                </div>
            </div>
        </div>
    </div>
</aside>

<!-- Right Sidebar -->
<aside id="rightsidebar" class="right-sidebar">
    <div class="slim_scroll">
        <div class="card">
            <h6>Demo Skins</h6>
            <ul class="choose-skin list-unstyled">
                <li data-theme="purple">
                    <div class="purple"></div>
                </li>                   
                <li data-theme="blue">
                    <div class="blue"></div>
                </li>
                <li data-theme="cyan">
                    <div class="cyan"></div>
                </li>
                <li data-theme="green" class="active">
                    <div class="green"></div>
                </li>
                <li data-theme="orange">
                    <div class="orange"></div>
                </li>
                <li data-theme="blush">
                    <div class="blush"></div>
                </li>
            </ul>
        </div>
        <div class="card theme-light-dark">
            <h6>Left Menu</h6>
            <button class="btn btn-default btn-block btn-round btn-simple t-light">Light</button>
            <button class="btn btn-default btn-block btn-round t-dark">Dark</button>
        </div> 
    </div>
</aside>