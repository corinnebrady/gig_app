GigApp::Application.routes.draw do

  root :to => "pages#index"

  devise_for :user

  get "/artists/fetch" => 'artists#fetch'

  resources :artists
  resources :events
end
