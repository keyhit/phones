Rails.application.routes.draw do
  # mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :units, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
  resources :lines
  resources :infos
  resources :admins
  get 'branches/admin_branches', to: 'branches#admin_branches', as: 'admin_branches'
  resources :branches do
    resources :organizations do
      resources :departaments do
        resources :units
      end
    end
  end
  post 'departaments', to: 'departaments#first_departament', as: 'first_departament'
  get 'units/update_account', to: 'units#update_account', as: 'update_account'
  patch 'units/update_unit_branch_id', to: 'units#update_unit_branch_id', as: 'update_unit_branch_id'
  get 'branch/select_branch', to: 'branches#select_branch', as: 'select_branch'
  get 'units/registration_new_unit', to: 'units#registration_new_unit', as: 'registration_new_unit'
  post 'units', to: 'units#save_new_unit', as: 'save_new_unit'

  get '/branches/:branch_id/organizations/:organization_id/departaments/:departament_id/units/:id/new_password', to: 'units#new_password', as: 'new_password'
  patch '/branches/:branch_id/organizations/:organization_id/departaments/:departament_id/units/:id/write_new_password', to:'units#write_new_password', as: 'write_new_password'

  get '/branches/:branch_id/organizations/:organization_id/departaments/:departament_id/units/:id/unit_edit', to: 'units#unit_edit', as: 'branch_organization_departament_unit_unit_edit'

  patch '/branches/:branch_id/organizations/:organization_id/departaments/:departament_id/units/:id/unit_edit_action', to: 'units#unit_edit_action', as: 'branch_organization_departament_unit_unit_edit_action'
  root 'branches#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
