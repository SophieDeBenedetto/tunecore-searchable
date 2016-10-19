Rails.application.routes.draw do
  resources :albums
  resources :songs
  resources :artists
  post '/search', to: 'search#create'
  root to: "welcome#show"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
