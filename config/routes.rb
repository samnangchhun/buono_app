Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'
  get 'fridge', to: 'pages#fridge'
  resources :recipes, only: [ :index, :show ] do
    resources :bookmarks, only: [ :create ]
  end
  resources :bookmarks, only: [ :destroy, :index ]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
