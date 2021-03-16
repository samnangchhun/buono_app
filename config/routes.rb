Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'
  get 'fridge', to: 'pages#fridge'
  resources :recipes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
