=begin
Rails.application.routes.draw do
  resources :transactions
  resources :categories
  root 'transactions#index'
end
=end
Rails.application.routes.draw do
  root 'transactions#index'
  get 'charts', to: 'charts#index'
  resources :transactions
  resources :categories
end