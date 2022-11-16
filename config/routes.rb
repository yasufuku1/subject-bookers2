Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :books, only:[:new,:show,:index]
  #get 'users/show'
  #get 'users/edit'
  #get 'books/new'
  #get 'books/index'
  #get 'books/show'
  #get 'books/edit'
  #get 'homes/top'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "homes#top"
  get 'homes/about'
end
