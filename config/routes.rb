# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, path: 'users', controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
    # passwords: 'users/passwords'
  }

  match '/admin', to: 'admin#index', via: :get
  match '/admin/users', to: 'admin#users', via: :get

  resources :events

  root to: 'public#landing'

  mount LetterOpenerWeb::Engine, at: 'letter_opener' if Rails.env.development? || Rails.env.staging?
end
