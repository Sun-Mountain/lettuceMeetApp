Rails.application.routes.draw do
  devise_for :users, path: 'users', controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
    # passwords: 'users/passwords'
  }

  root to: 'public#landing'

  if Rails.env.development? || Rails.env.staging?
    mount LetterOpenerWeb::Engine, at: 'letter_opener'
  end
end
