Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users do
    resources :events
  end
  post '/auth/login', to: 'authentication#login'
end
