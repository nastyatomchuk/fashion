Rails.application.routes.draw do
  devise_for :users

  root 'home#index'
  resources :home, only: [:index, :show]

  get 'about', to: 'home#about'

  resources :cart_items
  get 'cart' => 'cart#show'

  get  "users/:id" => "users#show"
  get 'admin' => 'welcome#i'

  namespace :admin do
    get '/', to: 'home#index'
    resources :currencies
    resources :currency_rates
    resources :products
    resources :users, except: :show
    get 'current_rates' => 'rates#current_rates'
  end
end
