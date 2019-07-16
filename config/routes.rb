Rails.application.routes.draw do
  # root to: '/devise/sessions#new'
  devise_for :users
  # root to: 'home#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => 'home#index'

  get '/user/edit'=>'user#edit'
  post '/user/update'=>'user#update'
  
  get '/cat/index'=>'category#index'
  get '/cat/new'=>'category#new'
  post '/cat/create'=>'category#create'
  get '/cat/edit/:id'=>'category#edit'
  post '/cat/update/:id'=>'category#update'
  get '/cat/delete/:id'=>'category#delete'

  get '/pro/index'=>'product#index'
  get '/pro/new'=>'product#new'
  post '/pro/create'=>'product#create' 
  get '/pro/edit/:id'=>'product#edit'
  post'/pro/update/:id'=>'product#update'
  get'/pro/delete/:id'=>'product#delete'
  get'/pro/show/:category_id'=>'product#show'


end
