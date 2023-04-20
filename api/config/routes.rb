# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :users do
    resources :events
    get 'public_events', action: :public_events, controller: 'events'
  end

  post '/auth/login', to: 'authentication#login'
end
