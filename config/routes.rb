Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "tweets#index"

 # get 'tweets', to: 'pages#tweets'
resources :users, only: [:show] do
resources :followings, only: [:create, :destroy]
end

  resources :tweets do
  	resources :replies
  	resources :likes


#resources :tweets do
#	resources :likes
#end
  end

end
