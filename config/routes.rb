Rails.application.routes.draw do
  devise_for :users

  root "home#index"
  resources :home, only: [:index, :show]
  get 'about' => 'home#about'

  get  "users/:id" => "users#show"
  get 'admin' => 'welcome#i'

  namespace :admin do
    resources :currencies
    resources :currency_rates
    resources :products
    resources :users
    get "current_rates" => "rates#current_rates"
  end
end
