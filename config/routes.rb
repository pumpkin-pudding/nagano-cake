Rails.application.routes.draw do
  devise_for :users
  # root to: 'homes#top'
# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  namespace :admin do
    get '/'=>'homes#top'
  resources :items, only: [:index, :new, :create, :show, :edit, :update]
  resources :genres, only: [:index, :create, :edit, :update]
  resources :customers, only: [:index, :show, :edit, :update]
  resources :orders, only: [:show, :update]
  resources :order_details, only: [:update]
  # resource :genres, only: [:create, :edit]
end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  scope module: :public do
    root to: 'homes#top'
    get '/homes/about' => "homes#about", as: "about"
    resources :cart_items, only:[:index, :create]
    get'/customers/information'=>'customers#information'
    get'/customers/information/edit'=>'customers/information#edit'
    patch'/customers/information'=>'customers#information'
    get'/customers/check'=>'customers#check'
    patch'/customers/withdraw'=>'customers#withdraw'
    get '/customers/check'=>'customers#check'
    patch '/customers/withdraw'=>'customers#withdraw'
    resources :cart_items, only:[:index, :update, :create, :destroy]
    delete '/cart_items' => 'cart_items#all_destroy'
    resources :orders, only:[:new, :index, :show]
    post '/orders/confirm'=>'orders#confirm'
    get '/orders/thanks'=>'orders#thanks'
    post '/orders/complete'=>'orders#complete'
    resources :addresses, only:[:index, :edit, :create, :update, :destroy]
  end


end
