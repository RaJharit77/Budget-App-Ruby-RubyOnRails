Rails.application.routes.draw do
  resources :transactions
  resources :categories
  root 'transactions#index'
end
