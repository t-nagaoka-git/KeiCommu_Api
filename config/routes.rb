Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        registrations: 'api/v1/auth/registrations'
      }

      namespace :auth do
        resources :sessions, only: %i[index]
      end

      resources :users, defaults: {format: 'json'}, only: [:show] do
        collection do
          get :search
        end

        member do
          get :following
          get :followers
        end
      end

      resources :microposts, defaults: {format: 'json'}, only: [:index, :create, :destroy] do
        collection do
          get :timeline
        end
      end

      resources :relationships, defaults: {format: 'json'}, only: [:create, :destroy] do
        collection do
          post 'create', action: :create
          post 'destroy', action: :destroy
        end
      end

      resources :teams, defaults: {format: 'json'}, only: [:create] do
        collection do
          get :list
          get :search
        end

        member do
          post :join
        end

        resources :team_messages, defaults: {format: 'json'}, only: [:index, :create] do
        end
      end
    end
  end
end
