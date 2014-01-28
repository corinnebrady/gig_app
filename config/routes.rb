GigApp::Application.routes.draw do

  devise_for :user

  root :to => "pages#index"
  get "/pages/search" => "pages#search"
  post "/pages/show_all_qs" => "pages#show_all_qs"
  get "/pages/about" => "pages#about"

  get "/events/show" => "events#show"
  get "/events/show_all" => "events#show_all"

  get "/artists/fetch" => 'artists#fetch'
  post "/artists/update_all" => "artists#update_all"
  resources :artists, :except => [:edit, :update] do
    collection do
      get 'edit'
    end
  end
end
