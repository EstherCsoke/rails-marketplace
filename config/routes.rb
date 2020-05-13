Rails.application.routes.draw do
  devise_for :users
  get '/', to: 'users#home', as: 'root'

  resources :listings
  
end
