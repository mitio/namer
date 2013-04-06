Namer::Application.routes.draw do
  root to: 'home#index'
  resources :naming_projects
end
