Rails.application.routes.draw do
  root "persons#profile"

  devise_for :users

  resources :products
  resources :users
  resources :currency
  resources :rates

  get 'admin', to: 'welcome#i'

  scope '/admin' do
    resources :users, :products, :currency, :rates
  end

end
