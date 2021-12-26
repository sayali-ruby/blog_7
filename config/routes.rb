Rails.application.routes.draw do
  resources :sports
  resources :categories

  namespace :api do
    namespace :v1 do
      resources :categories, except: [:new, :edit]
    end
  end

  namespace :api do
    namespace :v2 do
      resources :categories, only: [:show]
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
