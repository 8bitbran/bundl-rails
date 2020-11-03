Rails.application.routes.draw do
  devise_for :users
  root 'static#home'
  resources :groups, only: [:index, :show, :new, :create, :destroy] do
    resources :memberships, only: [:index], path: "/members"
    resources :discussions, only: [:index, :create, :destroy]
    resources :events, only: [:index, :show, :new, :create]
  end
  resources :events, only: [:index]
  resources :rsvps, only: [:create, :destroy]
  resources :memberships, only: [:create, :destroy]
end
