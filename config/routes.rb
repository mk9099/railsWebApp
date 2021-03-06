Rails.application.routes.draw do

  get 'contact', to: 'foods#contact'
  get 'errorpage', to: 'foods#errorpage'
  post 'request_contact', to: 'foods#request_contact'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :foods do
    resources :reviews
  end
  root 'foods#index'
end
