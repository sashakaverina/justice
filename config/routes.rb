Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :incidents
  resources :collections
  get '/index', to: "pages#index"

  #pdf generating routes
  get '/incidents/:id/report', to: 'incidents#report', as: :report

end
