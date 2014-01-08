Letmegolf::Application.routes.draw do
  root to: 'static_pages#home'
  match '/singleplay', to: 'static_pages#singleplay', via: 'get'
  match '/multiplayer', to: 'static_pages#multiplayer', via: 'get'
  match '/compete', to: 'static_pages#compete', via: 'get'
  match '/social', to: 'static_pages#social', via: 'get'
  match '/social/events', to: 'static_pages#events', via: 'get'
  match '/social/golfday', to: 'static_pages#golfday', via: 'get'

  resources :users
  match '/signup', to: 'users#new', via: 'get'

  resources :sessions, only: [:new, :create, :destroy]
  match '/signin', to: 'sessions#new', via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'

end
