Rails.application.routes.draw do
  resources :notifications
  devise_for :users
  root to: 'pages#home'
  resources :incidents
  resources :collections

  get '/my_incidents', to: "pages#my_incidents"
  get '/log_out', to: "pages#log_out"
  post '/share_many', to: "incidents#share_many", as: :share_many


  resources :chatrooms, only: [:show, :edit, :update, :index] do
    resources :messages, only: :create
    member do
      get :chatroom_pending
    end
  end



  #pdf generating routes
  get '/incidents/:id/report', to: 'incidents#report', as: :report
  post '/incidents/:id/share', to: 'incidents#share', as: :share
  get '/incidents/:id/match', to: 'incidents#match', as: :match

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :tags, only: [ :create ]
      get '/auth', to: 'auth#auth'
    end
  end

  resources :notifications, only: :index

end
