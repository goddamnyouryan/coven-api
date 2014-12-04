Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :posts, only: :index
      resources :sources, only: :index
    end
  end

  root 'static#index'
end
