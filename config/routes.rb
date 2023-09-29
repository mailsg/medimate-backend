Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  namespace :api do
    namespace :v1, defaults: { format: 'json' } do
      resources :doctors, only: [:index, :show, :new, :create, :destroy] do
        resources :appointments, only: [:index, :show, :new, :create, :destroy]
      end
    end
  end
end
