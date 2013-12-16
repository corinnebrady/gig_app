GigApp::Application.routes.draw do

  get "event/new"

  get "event/create"

  get "event/destroy"

  get "event/edit"

  get "event/update"

  get "event/index"

  get "artist/new"

  get "artist/create"

  get "artist/destroy"

  get "artist/edit"

  get "artist/update"

  get "artist/index"

  get "artist/show"

  devise_for :user

  root :to => "pages#index"

  # resources :artists
end
