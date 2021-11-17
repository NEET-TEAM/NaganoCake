Rails.application.routes.draw do
  root to: 'homes#top'
  get '/about' => 'homes#about'

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }

  # 顧客用
  # URL /customer/sign_in ...
  devise_for :customer,skip: [:passwords,], controllers: {
  registrations: "customer/registrations",
  sessions: 'customer/sessions'
  }
  
  resources :genres, only:[:create, :index, :edit, :update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
