Votenow::Application.routes.draw do
  resources :applications

  # oauth
  get '/login', to: redirect('/auth/github')
  match '/auth/github/callback', to: 'users#register', via: [:get, :post]

  root to: 'applications#index'
end
