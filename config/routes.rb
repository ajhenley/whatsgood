Rails.application.routes.draw do
  get 'spots/index' => 'spots#index'
  devise_for :users
  get 'spot/index' => 'spot#index'
  resources :spots
    
    root 'spots#index'
  get 'pages/home' => 'pages#home'
  get 'pages/home'

  get 'pages/about'

  get 'pages/pricing'

  get 'pages/contact'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
