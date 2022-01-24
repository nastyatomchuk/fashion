Rails.application.routes.draw do
  root "persons#profile"

  devise_for :users

  get 'admin', to: 'welcome#i'

  scope '/admin' do
    resources :users, :products, :currency, :rates
  end

end
