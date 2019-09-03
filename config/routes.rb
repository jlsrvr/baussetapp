Rails.application.routes.draw do
  devise_for :users
  root to: 'locations#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :locations, only: [:show] do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:index, :edit, :update, :destroy] #do
  #   resources :combinations, only: [:new, :create]
  # end
  get '/bookings/:id/choose_beds', to: 'bookings#choose_beds', as: 'choose_beds'
  patch '/bookings/:id/add_beds', to: 'bookings#add_beds', as: 'add_beds'
  patch '/bookings/:id/decline', to: 'bookings#decline', as: 'declined'

end
