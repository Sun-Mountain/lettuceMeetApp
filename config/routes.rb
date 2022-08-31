# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, path: 'users', controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
    # passwords: 'users/passwords'
  }

  resources :admin, only: [:index] do
    match :create_delete_admin, via: [:get, :post, :delete]
    match :create_delete_auth, via: [:get, :post, :delete]
  end

  match '/admin', to: 'admin#index', via: :get
  match '/admin/users', to: 'admin#users', via: :get

  root to: 'public#landing'

  mount LetterOpenerWeb::Engine, at: 'letter_opener' if Rails.env.development? || Rails.env.staging?
end
