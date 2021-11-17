Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers
  
    resources :items, only: [:new, :create, :index, :update, :show, :edit, :destroy]
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
