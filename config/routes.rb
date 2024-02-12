Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'removed_mentors', to: 'mentors#removed_mentors'
      resources :mentors, only: [:create, :index, :show, :destroy] do
        patch 'remove_mentor', on: :member
      end
      resources :users, only: [:create, :show] do
        get 'reservations', to: 'users#user_reservations', on: :member
      end
      resources :reservations, only: [:create, :index]
    end
  end
end
