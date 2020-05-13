Rails.application.routes.draw do
  devise_for :users
  get '/', to: 'users#home', as: 'root'

  # authenticated :user do
  # root :to => 'users#index', as: :authenticated_root
  # end
  # root :to => 'welcome#index'

  resources :listings
  
end
