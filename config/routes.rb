Votenow::Application.routes.draw do
  resources :applications do
    collection do
      get :score_events
      get 'score_events/:id', to: :score_events
    end
    match 'vote', on: :member, via: [:get, :post]
  end

  # oauth
  get '/login', to: redirect('/auth/github')
  get '/logout', to: 'users#logout'
  match '/auth/github/callback', to: 'users#register', via: [:get, :post]

  root to: 'applications#index'
end
