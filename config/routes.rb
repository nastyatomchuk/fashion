Rails.application.routes.draw do
  root "persons#profile"

  devise_for :users

  resources :products
  resources :users

  get  "users/:id" => "users#show"

  get 'admin' => 'welcome#i'

  get 'admin/users' => 'users#index'
end
