# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, path: 'users', controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
    # passwords: 'users/passwords'
  }

  resources :admin, path: '/admin', only: :index do
    match :authorization, via: %i[get patch]
    match :administration, via: %i[get patch]
  end

  match 'admin/users', to: 'admin#users', via: %i[get post]
  match 'admin/events', to: 'admin#events', via: :get

  resources :events

  root to: 'public#landing'

  mount LetterOpenerWeb::Engine, at: 'letter_opener' if Rails.env.development? || Rails.env.staging?
end
