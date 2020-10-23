Rails.application.routes.draw do
  get 'customer/index'

  root to: 'customer#index'
  resources :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
