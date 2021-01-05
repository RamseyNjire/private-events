Rails.application.routes.draw do
  get 'events/index'
  get 'events/new'
  get 'events/create'
  get 'events/show'
  devise_for :users
  resources :users, only: [:show]
  resources :events, only: [:index, :new, :create, :show]
end
