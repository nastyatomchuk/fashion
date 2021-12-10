Rails.application.routes.draw do
  root "welcome#i"

  get 'welcome', to: "welcome#i"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
