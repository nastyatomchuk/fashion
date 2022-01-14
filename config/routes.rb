Rails.application.routes.draw do
  root "persons#profile"

  devise_for :users

  resources :rates
  resources :products
  resources :users


  get  "users/:id" => "users#show"

  # get 'persons/profile', as: 'user_root'

  get 'admin' => 'welcome#i'

  get 'admin/users' => 'users#index'

  get 'admin/products' => 'products#index'

  get "admin/currency" => "currency#index"

  get "admin/rates" => "rates#index"

end
