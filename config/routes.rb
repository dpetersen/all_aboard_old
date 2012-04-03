AllAboard::Engine.routes.draw do
  match "admin" => "admin/admin#home", as: "admin"

  namespace :admin do
    resources :boards do
      resources :slides do
        resources :perspective_assignments
      end
    end

    resources :sources
  end

  resources :boards

  root to: "boards#index"
end
