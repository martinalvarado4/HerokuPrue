Rails.application.routes.draw do
  resources :noticions
  resources :serials do
    collection do
      get 'search'
    end
  end
  resources :serials do
  	resources :reviewses
  end
  resources :serials do
    collection do
      get 'search'
    end
    resources :chapters do
      resources :reviewches
    end
  end
  resources :serials do
    resources :chapters do
        resources :vistos
    end
  end
  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "serials#index"
end
