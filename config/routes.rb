require 'sidekiq/web'

Rails.application.routes.draw do

  devise_for :users

  get '/styleguide', to: "styleguide#show"

  mount Sidekiq::Web => (ENV['SIDEKIQ_PATH'] || '/sidekiq')

  # Examples:
  #
  # root 'welcome#index'
  #
  # resources :products do
  #   member do
  #     get 'short'
  #     post 'toggle'
  #   end
  #
  #   collection do
  #     get 'sold'
  #   end
  #
  #   resources :comments, :sales
  # end
end
