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
      delete '/withdraw' => 'users#withdraw'
      get '/complete' => 'users#complete'
      get '/my_post' => 'users#my_post'
      get '/favorite_post' => 'users#favorite_post'
      get '/following' => 'users#following'
    end
    resources :posts do
      resources :comments, only: [:create]
      resource :favorites, only: [:create, :destroy]
    end
    resource :contacts, only: [:new, :create]
    post '/contacts/confirm' => 'contacts#confirm'
    post '/contacts/back' => 'contacts#back'
    get '/contacts/complete' => 'contacts#complete'
    resources :notifications, only: [:index]
    resources :goals, only: [:index, :show]
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
    resources :comments, only: [:index]
    resources :contacts, only: [:index, :show]
    resources :goals, only: [:index, :show, :edit, :update]
  end


end
