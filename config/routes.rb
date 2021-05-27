Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :studios, only: [:index, :show] do
    resources :bookings, only: [:new, :create, :edit, :update, :destroy]
  end
  resources :bookings, only: [:index, :edit, :update]
  namespace :owner do
    resources :studios, except: [:show]
    resources :bookings, only: [:index, :update]
  end
end
