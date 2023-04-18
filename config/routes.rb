Rails.application.routes.draw do
  devise_for :users
  resources :books do
    resources :characters
  end

  root 'books#index'

  resources :users do
    resources :books, only: [:index]
  end
  
end
