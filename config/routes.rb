Rails.application.routes.draw do
  get 'user/account'
  get 'user/profile'
  patch 'user/profile/update',to:'user#profile_update'
  get 'user/profile/edit',to:'user#profile_edit'

  get '/',to:'room#index'
  get 'room/new'
  post 'room/create'
  get 'room/search'
  get 'room/own'
  get 'room/:id',to:'room#show'
  get 'room/:id/edit',to:'room#edit'
  patch 'room/:id/update',to:'room#update'
  
  get 'reservation/index'
  post 'reservation/confirm'
  post 'reservation/create'

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
