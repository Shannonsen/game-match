Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  
  resources :videogames
  resources :recommendations, only: [:new, :create]
  
  root "videogames#index"
end
