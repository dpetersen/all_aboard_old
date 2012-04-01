AllAboard::Application.routes.draw do
  namespace :admin do
    resources :boards do
      resources :slides do
        resources :perspective_assignments
      end
    end
  end

  resources :boards

  root to: "boards#index"
end
