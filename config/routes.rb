Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#index'

  get 'tweetslist', to: 'pages#tweets'

  resources :tweets do
  	resources :replies
  	resources :likes

  end

end
