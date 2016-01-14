Rails.application.routes.draw do
  resources :items, except: [:new, :edit]
  resources :lists, except: [:new, :edit]
end
