AllAboard::Engine.routes.draw do
  match "admin" => "admin/home#home", as: "admin"

  namespace :admin do
    resources :sources
  end

  resources :boards, only: [ :index, :show ]
  # These are nested Ember routes
  match "/boards/:id/*path" => "boards#show"
  match "/boards/*path" => "boards#index"

  resources :updates

  root to: "boards#index"
end
