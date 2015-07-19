Rails.application.routes.draw do

  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :songs
      resources :scores
      resource :users, only: [:show, :create]
    end
  end
end
