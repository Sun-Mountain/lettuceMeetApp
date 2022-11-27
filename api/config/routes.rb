# frozen_string_literal: true

Rails.application.routes.draw do
  # Health check
  get 'health/index'

  # API routes
  scope :api, defaults: { format: :json } do
    # User routes
    devise_for :users, controllers: { sessions: 'users/sessions',
                                      registrations: 'users/registrations'
                                    }
  end

  get '/member-data', to: 'members#show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
