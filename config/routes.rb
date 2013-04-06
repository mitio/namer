Namer::Application.routes.draw do
  root to: 'home#index'
  resources :projects do
    resources :suggestions
  end

  resource :pages, path: '/' do
    get :about, on: :collection
  end
end
