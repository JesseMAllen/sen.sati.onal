SenSatiOnal::Application.routes.draw do
  resources :bookmarks
  
  root to: 'static_pages#home'

  match '/create', to: 'bookmarks#new'
  match '/show', to:'bookmarks#show'
end
