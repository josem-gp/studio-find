Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :studios, only: [:index, :show]
  resources :bookings, only: [:new, :create, :index]
end
