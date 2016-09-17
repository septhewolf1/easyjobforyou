Rails.application.routes.draw do
  get 'archived_tasks/index'

  get 'archived_tasks/edit'

  get 'tasks/index'

  get 'tasks/edit'

  get 'tasks/new'

  get 'tasks/show'

  get 'welcome/index'

  resources :tasks

  resources :archived_tasks

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
