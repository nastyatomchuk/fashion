Rails.application.routes.draw do
  resources :users
  devise_for :users
  root "persons#profile"

  get 'persons/profile'

  get 'persons/profile', as: 'user_root'

  get 'admin' => 'welcome#i'

  get 'admin/users' => 'users#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
