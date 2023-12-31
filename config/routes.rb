Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # mount_devise_token_auth_for 'User', at: 'auth'
  # devise_for :users, skip: %i[registrations sessions passwords]
  # devise_scope :user do
  #   post 'users/sign_in', to: 'sessions#create', defaults: { format: 'json' }
  #   delete 'users/sign_out', to: 'sessions#destroy', defaults: { format: 'json' }
  #   post 'users/password', to: 'devise/password#create', defaults: { format: 'json' }
  #   patch 'users/password', to: 'devise/password#update', defaults: { format: 'json' }
  #   post 'users', to: 'registrations#create', defaults: { format: 'json' }
  #   patch 'users', to: 'registrations#update', defaults: { format: 'json' }
  #   delete 'users', to: 'registrations#destroy', defaults: { format: 'json' }
  # end

  devise_for :users, controllers: {
    registrations: 'registrations',
    sessions: 'sessions',
    passwords: 'passwords'
  }
  
  namespace :api do
    namespace :v1, defaults: { format: 'json' } do
      resources :doctors, only: [:index, :show, :new, :create, :destroy] 
      resources :appointments, only: [:index, :show, :new, :create, :destroy]
      resources :specializations, only: [:index, :create]
    end
  end
end
