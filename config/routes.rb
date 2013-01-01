AllAboard::Engine.routes.draw do
  match "admin" => "admin/home#home", as: "admin"

  namespace :admin do
    resources :sources
  end

  resources :boards, only: [ :index, :show, :create ]
  # These are nested Ember routes
  match "/boards/:id/*path" => "boards#show", via: :get
  match "/boards/*path" => "boards#index", via: :get

  resources :updates

  root to: "boards#index"
end
