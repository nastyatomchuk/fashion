Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :home, only: [:index, :show]
  get 'about', to: 'home#about'

  resources :products
  resources :cart_items
  get 'cart' => 'cart#show'
  get 'order', to: 'order#show'

  devise_scope :user do
    match 'sing_in', to: 'users/sessions#create', via: :post
    match '/users/sign_up', to: 'devise/registrations#create', via: :post
    match '/users/password/new', to: 'devise/passwords#create', via: :post
  end

  namespace :admin do
    get '/', to: 'home#index'
    resources :currencies
    resources :currency_rates
    resources :products
    resources :users, except: :show
    resources :categories, except: :show
    get 'current_rates' => 'rates#current_rates'
  end
end
