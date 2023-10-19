Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get '/homes/about' => "homes#about", as: "about"
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


# resources :admin do
  # resource :genres, only: [:create, :edit]
# end

get 'admin/genres' => 'admin/genres#index'
post 'admin/genres' => 'admin/genres#create'
get 'admin/genres/:id/edit' => 'admin/genres#edit', as: 'edit_genre'
patch '/admin/genres/:id' => 'admin/genres#update', as: 'update_genre'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
