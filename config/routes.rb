Namer::Application.routes.draw do
  root to: 'home#index'
  resources :naming_projects

  resource :pages, path: '/' do
    get :about, on: :collection
  end
end
