Letmegolf::Application.routes.draw do
  root to: 'static_pages#home'

  #static pages ============================================================

  match '/singleplay', to: 'static_pages#singleplay', via: 'get'
  match '/multiplayer', to: 'static_pages#multiplayer', via: 'get'
  match '/compete', to: 'static_pages#compete', via: 'get'
  match '/social', to: 'static_pages#social', via: 'get'
  match '/social/events', to: 'static_pages#events', via: 'get'
  match '/social/golfday', to: 'static_pages#golfday', via: 'get'


  #users = & messages ======================================================

  resources :users do
    collection do
      post :check_username
    end

    resources :messages, only: [:new, :create, :index] do
      collection do
        post :show_message
      end
    end

  end


  #groups ==================================================================

  resources :groups do
    collection do
      post :check_groupname
    end
  end


  match '/signup', to: 'users#new', via: 'get'
  match '/statistics', to: 'users#statistics', via: 'get'

  #sessions ================================================================

  resources :sessions, only: [:new, :create, :destroy]
  match '/signin', to: 'sessions#new', via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'

end
