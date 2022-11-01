Rails.application.routes.draw do
  
  root to: 'public/homes#top'
  get '/admin' => 'admin/homes#top', as: 'admin_top'
  get '/about' => 'public/homes#about', as: 'about'
  
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: 'admin/sessions',
  }
  
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  namespace :admin do
    resources :confirmations, only: [:new]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :orders, only: [:show]
    resources :unlocks, only: [:new]
  end
  
  # namespace :public do
  #   resources :confirmations, only: [:new]
  #   resources :unlocks, only: [:new]
  # end
  
  
    # resources :adresses, only: [:create, :index, :edit, :destroy]
    get '/addresses' => 'public/addresses#index', as: 'addresses'
    get '/addresses/:id/edit' => 'public/addresses#edit', as: 'edit_address'
    post '/addresses' => 'public/addresses#create', as: 'new_address'
    patch '/addresses/:id' => 'public/addresses#update', as: 'update_address'
    delete '/addresses/:id' => 'public/addresses#destroy', as: 'destroy_address'
    
    get '/cart_items' => 'public/cart_items#index', as: 'cart_items'
    post '/cart_items' => 'public/cart_items#create', as: 'new_cart_item'
    patch '/cart_items/:id' => 'public/cart_items#update', as: 'update_cart_item'
    delete '/cart_items/:id' => 'public/cart_items#destroy', as: 'delete_cart_item'
    get '/cart_items/destroy_all' => 'public/cart_items#destroy_all', as: 'destroy_all'
    
    get '/customers/my_page' => 'public/customers#show', as: 'my_page'
    get '/customers/information/edit' => 'public/customers#edit', as: 'edit_customer'
    patch '/customers/information' => 'public/customers#update', as: 'update_customer'
    get '/customers/unsbscribe' => 'public/customers#unsbscribe', as: 'unsbscribe'
    patch '/customers/withdraw' => 'public/customers#withdraw', as: 'withdraw'
    
    # resources :items, only: [:show]
    get '/items/:id' => 'public/items#show', as: 'item'
    get '/items' => 'public/items#index', as: 'items'
    
    # resources :orders, only: [:index, :show]
    get '/orders/new' => 'public/orders#new', as: 'new_order'
    post '/orders/confirm' => 'public/orders#confirm', as: 'confirm_order'
    post '/orders' => 'public/orders#create', as: 'create_order'
    get '/orders/complete' => 'public/orders#complete', as: 'order_complete'
    get '/orders' => 'public/orders#index', as: 'orders'
    get '/orders/:id' => 'public/orders#show', as: 'order'
    # resources :registrations, only: [:edit, :new]
    # resources :sessions, only: [:new]
    
    # get 'items' => 'public/adresses#index'
    # get 'cart_items' => 'public/cart_items#index'
    # get 'customers/:id' => 'public/customers#show'
    # get 'customers/:id/edit' => 'public/customers#edit'
    # get 'items' => 'public/items#index'
    # get 'items/:id' => 'public/items#show'
    # get 'orders/new' => 'public/orders#new'
    # get 'orders' => 'public/orders#index'
    # get 'orders/:id' => 'public/orders#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
