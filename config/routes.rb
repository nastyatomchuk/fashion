Rails.application.routes.draw do
  root "persons#profile"

  devise_for :users
  resources :users
  
end
