Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  post '/rate' => 'rater#create', :as => 'rate'
  get 'myspots' => 'spots#myindex'
  resources :spots
  resources :events
  get 'spots/index' => 'spots#index'
  devise_for :users
  get 'spot/index' => 'spot#index'

  root 'spots#index'
  get 'pages/home' => 'pages#home'
  get 'pages/home'

  get 'pages/about'

  get 'pages/pricing'

  get 'pages/contact'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
