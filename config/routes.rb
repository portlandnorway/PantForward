Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root :to => "collections#index"
  end
  root :to => redirect("/users/sign_in")

  resources :collections,  only: %i[show new create]
end
