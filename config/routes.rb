Rails.application.routes.draw do
  get 'cart_items/create'
  get 'cart_items/update'
  get 'cart_items/destroy'
  devise_for :users

  root "home#index"
  resources :home, only: [:index, :show]
  get 'about' => 'home#about'

  resources :cart_items
  get 'cart' => 'cart#show'

  get  "users/:id" => "users#show"
  get 'admin' => 'welcome#i'

  namespace :admin do
    resources :currencies
    resources :currency_rates
    resources :products
    resources :users
  end
end
