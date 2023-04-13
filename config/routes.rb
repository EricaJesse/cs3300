Rails.application.routes.draw do
  resources :books do
    resources :characters
  end

  root 'books#index'
end
