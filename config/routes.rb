Rails.application.routes.draw do
  root :to => "index#index"
  namespace :api do 
    namespace :v1 do
      resources :articles
    end
  end
end
