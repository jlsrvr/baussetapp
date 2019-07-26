Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'reservations', to: 'reservations#index'
  get 'reservations/:id', to: 'reservations#show', as: :reservation
end
