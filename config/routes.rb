require 'sidekiq/web'

Rails.application.routes.draw do
  resources :users
  root "articles#index"
  resources :articles do
    resources :comments
  end
  mount ArticleApi => '/'
  mount CommentApi => '/'
  mount Sidekiq::Web => '/sidekiq'
end
