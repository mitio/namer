Namer::Application.routes.draw do
  root to: 'home#index'

  resources :projects do
    resources :suggestions do
      resources :votes
    end
    resource :results
  end

  resources :suggestions, only: :index

  resource :pages, path: '/' do
    get :about, on: :collection
  end
end
