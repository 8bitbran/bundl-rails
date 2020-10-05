Rails.application.routes.draw do
  root 'static#home'
  resources :groups, only: [:index, :show]
end
