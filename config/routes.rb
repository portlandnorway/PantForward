Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root :to => "collections#index"
  end
  root :to => redirect("/users/sign_in")

  resources :collections,  only: %i[show new create] do
    resources :bookings, only: [:create]
  end

  resources :users, only: [:show], as: :dashboard
  resources :bookings, only: :show
  get '/map', to: 'collections#map', as: :map
  post '/bookings/:id', to: 'bookings#picked_up', as: :picked_up
end
