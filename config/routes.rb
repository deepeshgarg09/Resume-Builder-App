Rails.application.routes.draw do
  root   'home#index'
  get    'edit'    => 'home#edit'
  patch  'edit'    => 'profiles#update'
  get    'login'   => 'sessions#new'
  get    'sign_up' => 'registrations#new'
  post   'sign_up' => 'registrations#create'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  resources :profiles , only: [:update]
  resources :educations , only: [:new]
  resources :experiences , only: [:new]
  resources :projects , only: [:new]
  
end
