SenSatiOnal::Application.routes.draw do
  get "bookmarks/add"
  get "bookmarks/view"
  
  root to: 'static_pages#home'

  match '/create', to: 'bookmarks#add'
  match '/view', to:'bookmarks#view'
end
