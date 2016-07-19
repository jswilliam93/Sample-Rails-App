Rails.application.routes.draw do
  get 'password_resets/new'

  get 'password_resets/edit'

  get 'account_activations/edit'

  get 'sessions/new'

  get 'page_controller/home'

  get 'about' => 'page_controller#about'

  get 'help' => 'page_controller#help'

  get 'contact' => 'page_controller#contact'

  get 'signup' => 'users#new'

  get 'login' => 'sessions#new'

  post 'login' => 'sessions#create'

  delete 'logout' => 'sessions#destroy'

  root 'page_controller#home'

  resources :users

  resources :account_activations, only: [:edit]

  resources :password_resets, only:[:new, :create, :edit, :update]

  end
