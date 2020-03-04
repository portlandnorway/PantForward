Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root to: "collections#index"
  end
  root to: redirect("/new_user_landing")

  resources :collections do
    resources :bookings, only: [:create]
  end
  resources :bookings, only: :show

  get :dashboard,        to: 'users#dashboard'
  get :map,              to: 'collections#map'
  get :new_user_landing, to: 'users#new_user_landing'
  get :learn,            to: 'users#learn'

  post '/bookings/:id/confirmed', to: 'bookings#confirmed', as: :confirmed
  post '/bookings/:id',           to: 'bookings#picked_up', as: :picked_up

  mount ActionCable.server => "/cable"
end
