Rails.application.routes.draw do
  devise_for :units, path: 'auth', path_names: { sign_in: 'login',
                                                 sign_out: 'logout',
                                                 password: 'secret',
                                                 confirmation: 'verification',
                                                 unlock: 'unblock',
                                                 registration: 'register',
                                                 sign_up: 'cmon_let_me_in' }

  resources :lines

  get 'feedbacks/new', to: 'feedbacks#new', as: 'new_feedback'

  post 'feedbacks', to: 'feedbacks#send_feedback', as: 'send_feedback'

  resources :searches

  resources :infos

  resources :admins

  resources :branches do
    resources :organizations do
      resources :departaments do
        resources :units
      end
    end
  end

  get 'branches/admin_branches',
      to: 'branches#admin_branches',
      as: 'admin_branches'

  patch 'units/update_unit_branch_id', to: 'units#update_unit_branch_id', as: 'update_unit_branch_id'

  patch '/branches/:branch_id/organization/:id',
        to: 'organizations#set_organization_public_unit',
        as: 'set_organization_public_unit_branch_organization'

  post 'departaments',
       to: 'departaments#first_departament',
       as: 'first_departament'

  patch '/branches/:branch_id/organization/:organization_id/departament/:id/set_public_unit_id',
        to: 'departaments#set_public_unit_id',
        as: 'set_public_unit_id_branch_organization_departament'

  patch '/branches/:branch_id/organization/:organization_id/departament/:id/unset_public_unit_id',
        to: 'departaments#unset_public_unit_id',
        as: 'unset_public_unit_id_branch_organization_departament'

  get 'units/update_account',
      to: 'units#update_account',
      as: 'update_account'
  get 'branch/select_branch', to: 'branches#select_branch', as: 'select_branch'
  post 'units', to: 'units#save_new_unit', as: 'save_new_unit'

  get '/branches/:branch_id/organizations/:organization_id/departaments/:departament_id/units/:id/new_password',
      to: 'units#new_password',
      as: 'new_password'

  patch '/branches/:branch_id/organizations/:organization_id/departaments/:departament_id/units/:id/write_new_password',
        to: 'units#write_new_password',
        as: 'write_new_password'

  get '/branches/:branch_id/organizations/:organization_id/departaments/:departament_id/units/:id/unit_edit',
      to: 'units#unit_edit',
      as: 'branch_organization_departament_unit_unit_edit'

  patch '/branches/:branch_id/organizations/:organization_id/departaments/:departament_id/units/:id/unit_edit_action',
        to: 'units#unit_edit_action',
        as: 'branch_organization_departament_unit_unit_edit_action'

  patch 'units',
        to: 'units#locale',
        as: 'locale_branch_organization_departament_unit'

  patch '/branches/:branch_id/organization/:id/set_public_unit_id',
        to: 'organizations#set_public_unit_id',
        as: 'set_public_unit_id_branch_organization'

  patch '/branches/:branch_id/organization/:id/unset_public_unit_id',
        to: 'organizations#unset_public_unit_id',
        as: 'unset_public_unit_id_branch_organization'

  root 'branches#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
