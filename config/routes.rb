Rails.application.routes.draw do
  devise_for :users

  root "persons#profile"
  get  "users/:id" => "users#show"
  get 'admin' => 'welcome#i'

  namespace :admin do
    resources :products
    resources :users
    resources :currency
    resources :rates
    get "current_rates" => "rates#current_rates"
  end
end
