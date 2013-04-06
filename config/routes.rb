Namer::Application.routes.draw do
  root to: 'home#index'
  resources :naming_projects do
    resources :suggestions
  end

  resource :pages, path: '/' do
    get :about, on: :collection
  end
end
