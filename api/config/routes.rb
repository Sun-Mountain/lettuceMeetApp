# frozen_string_literal: true

Rails.application.routes.draw do
  post 'refresh', controller: :refresh, action: :create
  post 'signin', controller: :signin, action: :create
  post 'registration', controller: :registration, action: :create
  # delete 'signin', controller: :signin, action: :destroy

  resources :todos
end
