Rails.application.routes.draw do
  devise_for :users
  root to: 'locations#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :locations, only: [:show] do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:index, :edit, :update] do
    resources :combinations, only: [:new, :create]
  end

end
