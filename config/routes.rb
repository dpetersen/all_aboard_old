AllAboard::Engine.routes.draw do
  match "admin" => "admin/home#home", as: "admin"

  namespace :admin do
    resources :sources
  end

  resources :boards, only: [ :index, :show, :create ]
  resources :slides, only: :create

  # These are nested Ember routes.  They must exist to allow deep linking.
  match "/board/*path" => "boards#index", via: :get
  match "/boards/*path" => "boards#index", via: :get

  resources :updates

  root to: "boards#index"
end
