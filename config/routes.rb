Rails.application.routes.draw do
  devise_for :users, path: 'users', controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
    # passwords: 'users/passwords'
  }

  root to: 'public#landing'
end
