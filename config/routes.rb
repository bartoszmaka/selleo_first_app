Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  root to: 'posts#index'
  devise_for :users
  resources :users

  resources :posts do
    resources :comments
  end
end
