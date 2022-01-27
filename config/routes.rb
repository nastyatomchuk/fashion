Rails.application.routes.draw do
  root "persons#profile"

  devise_for :users

  namespace :admin do
    resources :users
  end
end
