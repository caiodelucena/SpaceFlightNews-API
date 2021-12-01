Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do
      root 'index#index'
      resources :articles
    end
  end
end
