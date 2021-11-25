Rails.application.routes.draw do

  root to: 'homes#top'
  get '/about' => 'homes#about'
  get '/admin' => 'admin/homes#top'
  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }

  namespace :admin do
   resources :customers, only: [:index, :edit, :update, :show] do
     collection do
        patch "withdraw"
      end
    end
   resources :genres, only: [:index, :create, :edit, :update]
   resources :items, only: [:show, :index, :new, :create, :edit, :update]
    resources :customers, only: [:index, :edit, :update, :show]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:show, :index, :new, :create, :edit, :update]
    resources :orders, only: [:index, :show, :update] do
      resources :order_histries, only: [:update]
    end
  end

  # 顧客用
  # URL /customer/sign_in ...
  devise_for :customer,skip: [:passwords,], controllers: {
  registrations: "customer/registrations",
  sessions: 'customer/sessions'
  }


  scope module: :customer do
    resources :customers, only: [:show, :edit, :update] do
      collection do
        get "out"
        patch "withdraw"
      end
    end
  end

  namespace :customer do
    resources :items, only:[:show, :index]
    resources :addresses, only:[:new, :index, :create, :edit, :update, :destroy]
    resources :cart_items, only:[:index, :create, :update, :destroy] do
      collection do
        delete "destroy_all"
      end
    end

    get "orders/check" => "orders#check"
    post "orders/check" => "orders#check"
    get "orders/thanks" => "orders#thanks"
    resources :orders, only:[:show, :index, :create, :new]

    delete "cart_items/destroy_all" => "cart_items#destroy_all"
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
