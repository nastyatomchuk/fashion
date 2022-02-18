Rails.application.routes.draw do
  devise_for :users

  root "persons#profile"
  get  "users/:id" => "users#show"
  get 'admin' => 'welcome#i'

  namespace :admin do
    resources :currencies
    resources :currency_rates
    post 'current_rates', to: 'currency_rates#current_rates'
    resources :products
    resources :users
  end
end
