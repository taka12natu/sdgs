Rails.application.routes.draw do

  devise_for :users, controllers: {
        registrations: 'public/registrations',
          sessions: 'public/sessions',
          passwords: 'public/passwords'
        }

  namespace :public do

  end

  devise_for :admins, controllers: {
        sessions: 'admins/sessions'
      }

  namespace :admins do
  	get 'top' => 'tops#top'
  end

      get '/top' => 'public/tops#top'

end
