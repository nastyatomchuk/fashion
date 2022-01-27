Rails.application.routes.draw do
  devise_for :users

  get 'persons/profile'

  root "persons#profile"


  get 'persons/profile', as: 'user_root'

  get 'admin/products' => 'products#index'
end
