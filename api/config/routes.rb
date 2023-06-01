# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {
    confirmations: "confirmations",
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :users do
    resources :events
    get 'all_public', action: :all_public, controller: 'events'
    get 'owned', action: :user_owned, controller: 'events'
  end

  resources :admin

  if Rails.env.development?
    require 'sidekiq/web'
    mount Sidekiq::Web, at: '/sidekiq'
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
