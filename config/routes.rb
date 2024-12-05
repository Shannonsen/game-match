Rails.application.routes.draw do
  resources :videogames, only: :index
  resources :recommendations, only: [:new, :create, :show]
end
