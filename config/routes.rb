Rails.application.routes.draw do

  root to: 'homes#top'
  get '/about' => 'homes#about'

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }

  namespace :admin do
    resources :customers, only: [:index, :edit, :update, :show]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:show, :index, :new, :create, :edit, :update]
    resources :orders, only: [:index, :show, :update]
    resources :order_histories, only: [:update]
  end

  # 顧客用
  # URL /customer/sign_in ...
  devise_for :customer,skip: [:passwords,], controllers: {
  registrations: "customer/registrations",
  sessions: 'customer/sessions'
  }


  scope module: :customer do
    resources :customers, only: [:show, :edit, :update, :quit]
    get 'customers/:id/out' => 'customers#out', as: 'out_customers'
    patch 'customers/withdraw' => 'customers#withdraw', as: 'withdraw_customers'

  end

  namespace :customer do
    resources :items, only:[:show, :index]
    resources :addresses, only:[:new, :index, :create, :edit, :update, :destroy]
    resources :cart_items, only:[:index, :create, :update, :destroy]
    resources :order, only:[:new, :show, :create]
    
    delete "cart_items/destroy_all" => "cart_items#destroy_all"
  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
