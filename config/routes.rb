Rails.application.routes.draw do
  # get 'users/show'
  # get 'users/index'
  get 'static_pages/home'
  get 'static_pages/help'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }, path_names: {
    sign_up: 'add'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'static_pages#home'

  resources :users, only: [:index, :show, :destroy]
  resources :projects, only: [:create, :destroy, :edit, :update, :show]
  delete ':id_e/employee/:id_p/project', to: 'projects#destroy_employee_from_project', as: 'destroy_employee_from_project'
  post 'employee/:id', to: 'projects#add_employee_to_project', as: 'project_details'
end
