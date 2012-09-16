AllAboard::Engine.routes.draw do
  match "admin" => "admin/home#home", as: "admin"

  namespace :admin do
    resources :sources
  end

  resources :boards
  # These are nested Ember routes
  match "/boards/:id/*path" => "boards#show"

  resources :updates

  root to: "boards#index"
end
