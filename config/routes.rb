Votenow::Application.routes.draw do
  resources :applications do
    match 'vote', on: :member, via: [:get, :post]
  end

  # oauth
  get '/login', to: redirect('/auth/github')
  match '/auth/github/callback', to: 'users#register', via: [:get, :post]

  root to: 'applications#index'
end
