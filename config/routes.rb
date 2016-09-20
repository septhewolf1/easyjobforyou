Rails.application.routes.draw do
  
  root 'admin#index'

  get 'admin/index'
  
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  resources :users

  resources :tasks

  resources :archived_tasks

  resources :waits

  #root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
