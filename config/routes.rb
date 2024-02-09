Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      resources :mentors, only: [:create, :index, :show, :destroy] do
        patch 'remove_mentor', on: :member
        patch 'restore_mentor', on: :member
      end
      resources :reservations, only: [:create, :index]
    end
  end
end
