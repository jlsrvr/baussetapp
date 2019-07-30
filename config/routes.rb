Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :location, only: [:show] do
    resources :bookings, only: [:index]
  end
  resources :bookings, except: [:index]
end
