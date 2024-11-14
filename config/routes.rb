Rails.application.routes.draw do
  get '/', to: 'videogames#index'
  resources :recommendations, only: [:new, :create, :show]
end
