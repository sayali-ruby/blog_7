Rails.application.routes.draw do
  resources :sports
  resources :categories

  namespace :api do
    namespace :v1 do
      resources :categories
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
