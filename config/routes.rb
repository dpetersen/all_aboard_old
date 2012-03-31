AllAboard::Application.routes.draw do
  namespace :admin do
    resources :boards do
      resources :slides do
        resources :perspective_assignments
      end
    end
  end

  root to: "sources#index"
end
