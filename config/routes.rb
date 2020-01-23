Rails.application.routes.draw do
  devise_for :admins, controllers: {
        sessions: 'admin/sessions'
      }
      # NH~JW MIGHT NIX THIS ONE, ABOVE!!?


  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root to: 'characters#index'

  resources :characters
  resources :items
  resources :locations
  resources :rivals

end
