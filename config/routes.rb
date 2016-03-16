Rails.application.routes.draw do
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out/:id' => 'users#signout'
  patch '/change-password/:id' => 'users#changepw'
  resources :users, only: [:index, :show]

  resources :lists, except: [:new, :edit] do
    resources :items, only: [:index, :create]
  end
  resources :items, only: [:show, :update, :destroy]
end
