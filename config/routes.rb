Rails.application.routes.draw do
  get 'errors/not_found'
  get 'errors/internal_server_error'
    devise_for :users
    root 'home#index'
    resources :home, only: [:index, :show]
    get 'about', to: 'home#about'

    resources :products
    resources :cart_items
    resources :category
    resources :order
    get 'cart', to: 'cart#show'

    devise_scope :user do
      match 'sing_in', to: 'users/sessions#create', via: :post
      match '/users/sign_up', to: 'devise/registrations#create', via: :post
      match '/users/password/index', to: 'devise/passwords#create', via: :post
    end

    namespace :admin do
      get '/', to: 'home#index'
      resources :currencies
      resources :currency_rates
      resources :products
      resources :users, except: :show
      resources :categories, except: :show
      get 'current_rates' => 'rates#current_rates'
      resources :stores, except: :show
    end

  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all
end
