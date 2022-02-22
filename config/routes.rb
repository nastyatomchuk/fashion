Rails.application.routes.draw do
  devise_for :users

  root 'home#index'
  resources :home, only: [:index, :show]
  get 'about', to: 'home#about'

  get 'users/:id', to: 'users#show'

  namespace :admin do
    get '/', to: 'home#index'
    resources :currencies
    resources :currency_rates
    resources :products
    resources :users
    get 'current_rates' => 'rates#current_rates'
  end
end
