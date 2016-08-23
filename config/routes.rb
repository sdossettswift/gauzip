Rails.application.routes.draw do

  get 'entourage' => 'users#following', as: :following

  post 'follow/:user_id' => 'users#follow', as: :follow
  post 'unfollow/:user_id' => 'users#unfollow', as: :unfollow

  get 'sign_in' => 'sessions#new', as: :sign_in
  post 'sign_in' => 'sessions#create'
  delete 'sign_out' => 'sessions#delete', as: :end_session
  get 'sign_out' => 'sessions#delete', as: :sign_out

  resources :users, :posts

  get 'dashboard/welcome'
  root 'dashboard#welcome'

end
