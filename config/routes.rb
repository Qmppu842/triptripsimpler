Rails.application.routes.draw do
  resources :trips
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'trips#list'
  get 'arena', to:'trips#arena'
  post 'arena', to:'trips#save_arena_results'

  get 'triplist', to: 'trips#list'


end
