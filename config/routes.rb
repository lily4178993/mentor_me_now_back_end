Rails.application.routes.draw do
  # Define API routes
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      resources :mentors, only: [:create, :index, :show, :destroy]
      resources :reservations, only: [:create, :index]
    end
  end
end
