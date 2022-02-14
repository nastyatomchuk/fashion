Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  devise_scope :user do
    root to: 'welcome#i'
    match '/login', to: 'devise/sessions#create', via: :post
  end

  # get  "users/:id" => "users#show"
  get 'admin' => 'welcome#i'
  get 'login' => 'persons#profile'

  namespace :admin do
    resources :currencies
    resources :currency_rates
    resources :products
    resources :users
  end
end
