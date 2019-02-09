Rails.application.routes.draw do
  root 'books#top'
  devise_for :users
  resources :books
  resources :users, only:[:show, :edit, :update, :index]

  get "/about" => "books#about"

  # ログイン後インデックスページへ
  get 'after_login_to_index', to: "books#index", as:"after_login_to_index"


end
