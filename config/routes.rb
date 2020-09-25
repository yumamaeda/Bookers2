Rails.application.routes.draw do
  devise_for :users
  get "/" => 'home#show'
  get  "home/about" => 'home#index'
  get 'home/new'
  get 'home/edit'
  # root :to => 'home#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books
  root 'books#index'
  resources :users, only: [:show, :edit, :update, :index]
end
