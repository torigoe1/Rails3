Rails.application.routes.draw do
  get 'user/account'
  get 'user/profile'
  patch 'user/profile/update',to:'user#profile_update'
  get 'user/profile/edit',to:'user#profile_edit'

  get '/',to:'room#index'
  get 'room/new'
  post 'room/create'

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
