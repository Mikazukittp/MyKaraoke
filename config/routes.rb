Rails.application.routes.draw do

  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :songs
      resources :scores do
        get 'check', :on => :collection
      end
      resource :users, only: [:show, :create]
      resources :categories, only: [:index, :show, :create]
    end
  end
end
