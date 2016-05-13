require 'sidekiq/web'

Rails.application.routes.draw do
  root 'home#index'

  devise_for :users

  namespace :api do
    jsonapi_resources :posts
  end

  mount Sidekiq::Web => (ENV['SIDEKIQ_PATH'] || '/sidekiq')
end
