Rails.application.routes.draw do
  devise_for :users
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

get 'admin/genres' => 'admin/genres#index'
post 'admin/genres' => 'admin/genres#create'
patch '/admin/genres/:id' => 'admin/genres#update', as: 'update_genre'
get 'admin/genres/:id/edit' => 'admin/genres#edit', as: 'edit_genre'

get 'admin/customers/:id/edit' => 'admin/customers#edit', as: 'edit_customer'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
