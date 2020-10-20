Rails.application.routes.draw do
  devise_for :users
  root 'static#home'
  resources :groups, only: [:index, :show, :new, :create]
  resources :events, only: [:index, :show, :new, :create]
  resources :rsvps, only: [:create, :destroy]
end
