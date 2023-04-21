# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :users do
    resources :events
    get 'all_public', action: :all_public, controller: 'events'
  end

  post '/auth/login', to: 'authentication#login'
end
