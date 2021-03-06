Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/profile' => 'pages#profile'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :recipes do
    resources :likes
    resources :doses
  end
  resources :ingredients
  resources :users
end
