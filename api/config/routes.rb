Rails.application.routes.draw do
  root "index#index"
  namespace :api do
    namespace :v1 do
      resources :healthchecks, only: %i(index)
      resources :todos, only: [:index, :show, :create, :update, :destroy]
    end
  end
end
