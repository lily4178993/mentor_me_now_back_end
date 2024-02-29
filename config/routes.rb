Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  root to: redirect('/api-docs')
  
  namespace :api do
    namespace :v1 do
      get 'removed_mentors', to: 'mentors#removed_mentors'
      resources :mentors, only: [:create, :index, :show, :destroy] do
        patch 'remove_mentor', on: :member
      end
      resources :users, only: [:create,:index, :show] do
        get 'users', to: 'users#index', on: :collection
        get 'reservations', to: 'users#user_reservations', on: :member
        get 'find_by_username', to: 'users#find_by_username', on: :collection
      end
      resources :reservations, only: [:create, :index]
    end
  end
end