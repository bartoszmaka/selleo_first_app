Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  root to: 'posts#index'
  devise_for :users
  resources :users

  namespace :admin do
    resources :posts, except: %i[index show]
  end

  resources :posts, only: %i[index show] do
    resources :comments
  end
end
