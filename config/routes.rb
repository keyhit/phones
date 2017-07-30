Rails.application.routes.draw do
  # mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :units, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
  resources :lines
  resources :admins
  get 'branches/admin_branches', to: 'branches#admin_branches', as: 'admin_branches'
  resources :branches do
    resources :organizations do
      resources :departaments do
        resources :units
      end
    end
  end
  post 'update_foreign_ids', to: 'units#update_foreign_ids', as: 'update_foreign_ids'
  get 'branch/select_branch',to: 'branches#select_branch', as: 'select_branch'
  get 'units/registration_new_unit', to: 'units#registration_new_unit', as: 'registration_new_unit'
  post 'units', to: 'units#save_new_unit', as: 'save_new_unit'
  get 'organization/:organization_id/departament/:departament_id/unit/:id', to: 'units#new_password', as: 'new_password' 
  get 'organization/:organization_id/departament/:departament_id/unit/:id/units_self_admin', to: 'units#units_self_admin', as: 'units_self_admin'
  root 'branches#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
