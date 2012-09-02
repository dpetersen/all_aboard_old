AllAboard::Engine.routes.draw do
  match "admin" => "admin/home#home", as: "admin"

  namespace :admin do
    resources :sources
  end

  resources :boards

  root to: "boards#index"
end
