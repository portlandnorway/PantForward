Rails.application.routes.draw do
  get 'users/show'
  devise_for :users

  authenticated :user do
    root :to => "collections#index"
  end
  root :to => redirect("/users/sign_in")

  resources :collections,  only: %i[show new create] do
    resources :bookings, only: [:create]
  end

  resources :users, only: [:show], as: :dashboard
  get '/map', to: 'collections#map', as: :map
  resources :bookings, only: :show
end
