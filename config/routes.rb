SenSatiOnal::Application.routes.draw do
  resources :bookmarks
  
  root to: 'static_pages#home'

  match '/create', to: 'bookmarks#add'
  match '/view', to:'bookmarks#view'
end
