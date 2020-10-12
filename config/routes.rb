Rails.application.routes.draw do

  devise_for :users, controllers: {
        registrations: 'public/registrations',
          sessions: 'public/sessions',
          passwords: 'public/passwords'
        }

  scope module: :public do
    resources :users, only: [:show, :edit, :update] do
      resource :favorites, only: [:create, :destroy]
      resources :relationships, only: [:create, :destroy]
      delete '/withdraw' => 'users#withdraw'
      get '/complete' => 'users#complete'
    end
    resources :posts do
      resources :comments, only: [:create]
      resource :favorites, only: [:create, :destroy]
    end
    get '/top' => 'tops#top'
    resource :contacts, only: [:new, :create]
    post '/contacts/confirm' => 'contacts#confirm'
    post '/contacts/back' => 'contacts#back'
    get '/contacts/complete' => 'contacts#complete'

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
  end


end
