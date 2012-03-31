AllAboard::Application.routes.draw do
  namespace :admin do
    resources :boards
  end

  root to: "sources#index"
end
