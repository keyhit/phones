Rails.application.routes.draw do
  devise_for :units, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
  resources :lines
  resources :organizations do
    resources :departaments do
      resources :units
    end
  end
  root 'organizations#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
