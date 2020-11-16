Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'static#home'
  resources :searches
  resources :groups do
    resources :memberships, only: [:index], path: "/members"
    resources :discussions, only: [:index, :create, :destroy]
    resources :events, only: [:index, :show, :new]
  end
  resources :events, only: [:index, :create]
  resources :rsvps, only: [:create, :destroy]
  resources :memberships, only: [:create, :destroy]
end
