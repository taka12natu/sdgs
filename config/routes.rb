Rails.application.routes.draw do

  root 'public/tops#root'

  devise_for :users, controllers: {
        registrations: 'public/registrations',
          sessions: 'public/sessions',
          passwords: 'public/passwords'
        }

  scope module: :public do
    resources :users, only: [:show, :edit, :update] do
      resources :favorites, only: [:index]
      resources :relationships, only: [:create, :destroy]
      delete :withdraw
      get :complete
      get :my_post
      get :favorite_post
      get :following
    end
    resources :posts do
      resources :comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
    resource :contacts, only: [:new, :create] do
      post :confirm
      post :back
      get :complete
    end
    resources :notifications, only: [:index]
    resources :goals, only: [:index, :show]
    resources :post_images, only: [:index]
  end

  devise_for :admins, controllers: {
        sessions: 'admins/sessions'
      }

  namespace :admins do
  	get 'top' => 'tops#top'
    get 'search' => 'searches#search'
    resources :tags, only: [:index, :create, :destroy]
    resources :posts, only: [:index, :show]
    resources :users, only: [:index, :show]
    resources :comments, only: [:index, :destroy]
    resources :contacts, only: [:index, :show]
    resources :goals, only: [:index, :show, :edit, :update]
  end


end
