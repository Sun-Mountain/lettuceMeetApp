# frozen_string_literal: true

Rails.application.routes.draw do
  Rails.application.routes.draw do
    devise_for :users, path: '', path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      registration: 'signup'
    },
    controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
    }
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :users do
    resources :events
    get 'all_public', action: :all_public, controller: 'events'
  end

  post '/auth/login', to: 'authentication#login'
end
