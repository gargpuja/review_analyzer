
require 'sidekiq/web'
Rails.application.routes.draw do
	mount Sidekiq::Web => '/sidekiq'
  get 'home/index' 
  root 'home#index'
  resources :businesses
  resources :reports
  resources :locations
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
