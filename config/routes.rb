Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  scope '', as: 'home' do
    root 'home#index'
    post '/lead_opportunity', to: 'home#lead_opportunity', as: 'lead_opportunity'
  end

  namespace :admin do
    get '/dashboard', to: 'dashboard#index'

    scope 'jobs', as: 'jobs' do
      get '', to: 'jobs#index'
      get '/new', to: 'jobs#new'

      post '', to: 'jobs#create', as: 'create'
    end
  end

  namespace :sessions do
    scope 'signup', as: 'signup' do
      get '', to: 'signup#signup'
      post '', to: 'signup#create', as: 'create'
    end

    scope 'signin' do
      get '', to: 'signin#signin', as: 'signin'
      post '', to: 'signin#authenticate', as: 'authenticate'
    end
  end
end
