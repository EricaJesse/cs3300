Rails.application.routes.draw do
  devise_for :users
  resources :books do
    resources :characters
  end

  root 'books#index'

  resources :users do
    resources :books, only: [:index]
  end

  resources :books do
    resources :characters, only: [:new, :create, :edit, :update]
  end
  
  
end
