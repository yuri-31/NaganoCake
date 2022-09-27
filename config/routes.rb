Rails.application.routes.draw do
  
  root to: 'public/homes#top'
  get 'home/about' => 'public/homes#about', as: 'about'
  
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: 'admin/sessions',
  }
  
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  namespace :admin do
    resources :confirmations, only: [:new]
    resources :customers, only: [:index, :show, :edit]
    resources :genres, only: [:index, :edit]
    resources :homes, only: [:top]
    resources :items, only: [:index, :new, :show, :edit]
    resources :orders, only: [:show, :index]
    resources :sessions, only: [:new]
    resources :unlocks, only: [:new]
  end
  
  namespace :public do
    resources :adresses, only: [:index, :edit]
    resources :cart_items, only: [:index]
    resources :confirmations, only: [:new]
    resources :customers, only: [:show, :edit]
    resources :homes, only: [:about, :top]
    resources :items, only: [:index, :show]
    resources :orders, only: [:new, :index, :show]
    resources :registrations, only: [:edit, :new]
    resources :sessions, only: [:new]
    resources :unlocks, only: [:new]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
