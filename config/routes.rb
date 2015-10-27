Rails.application.routes.draw do
  root 'welcome#index'

  get '/auth/github/callback', to: 'sessions#create'

  get '/auth/failure', to: 'sessions#failure'

  get '/dashboard', to: 'sessions#show'
end
