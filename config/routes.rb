Rails.application.routes.draw do
  devise_for :users

  resources :users do 
  	member do
  		get :following, :followers
  	end
  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#index'

  get 'tweetslist', to: 'pages#tweets'

  resources :tweets do
  	resources :replies
  	resources :likes

  end

  resources :users do
    resources :notifications, only: [:create, :destroy]
    member do
      get :following, :followers
    end
  end

  resources :followings,       only: [:create, :destroy]

end
