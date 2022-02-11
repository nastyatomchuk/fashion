Rails.application.routes.draw do
  devise_for :users

  root "home#index"
  get  "users/:id" => "users#show"
  get 'admin' => 'welcome#i'

  namespace :admin do
    resources :currencies
    resources :currency_rates
    resources :products
    resources :users
  end
end
