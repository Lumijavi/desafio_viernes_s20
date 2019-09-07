Rails.application.routes.draw do

  get 'dashboard', to: 'pages#index'
  get 'role_update/:id', to: 'pages#role_update', as: 'role_update'
  delete 'user_delete/:id', to: 'pages#user_delete', as: 'user_delete'

	resources :posts do
		resources :comments, only: [:create, :destroy]
	end

	devise_for :users, controllers: {
		sessions: 'users/sessions',
		registrations: 'users/registrations'
	}

  post 'newrole/:id', to: 'pages#newrole', as: 'newrole_path'

	root 'posts#index'
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
