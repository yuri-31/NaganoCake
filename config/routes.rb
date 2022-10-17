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
  
  
    resources :adresses, only: [:index, :edit]
    get '/cart_items' => 'public/cart_items#index', as: 'cart_items'
    get '/customers/information/edit' => 'public/customers#edit', as: 'edit_customer'
    get '/customers/my_page' => 'public/customers#show', as: 'my_page'
    resources :items, only: [:show]
    get '/items' => 'public/items#index', as: 'items'
    resources :orders, only: [:new, :index, :show]
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
