Rails.application.routes.draw do
  resources :trips
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'trips#index'
  get 'arena', to:'trips#arena'
  post 'arenaleft', to:'trips#arena_results_left'
  post 'arenaright', to:'trips#arena_results_right'
  post 'arena', to:'trips#save_results'
end
