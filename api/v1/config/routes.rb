Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  namespace :user do
    resource :private_api_keys, only: :update
  end

  namespace :api do
    namespace :v1 do
      defaults format: :json do
        resources :posts, only: [:index, :create, :show, :update, :destroy]
      end
    end
  end
end
