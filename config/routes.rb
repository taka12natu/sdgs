Rails.application.routes.draw do

  devise_for :users, controllers: {
        registrations: 'public/registrations',
          sessions: 'public/sessions',
          passwords: 'public/passwords'
        }

  scope module: :public do
    resources :users, only: [:show, :edit, :update]
    resources :posts do
      resources :comments, only: [:create]
    end
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

  get '/top' => 'public/tops#top'

end
