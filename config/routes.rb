AllAboard::Application.routes.draw do
  namespace :admin do
    resources :boards do
      resources :slides
    end
  end

  root to: "sources#index"
end
