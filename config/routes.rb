Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    root to: 'welcome#i'
    match 'sing_in', to: 'users/sessions#create', via: :post
    match '/users/sign_up', to: 'devise/registrations#create', via: :post
    match '/users/password/new', to: 'devise/passwords#create', via: :post
  end

  get  "users/:id" => "users#show"
  get 'admin' => 'welcome#i'

  namespace :admin do
    resources :currencies
    resources :currency_rates
    resources :products
    resources :users
  end
end
