Rails.application.routes.draw do
  root 'solos#index'
  get 'groups/typeahead.json' => 'groups#typeahead'
  resources :groups
  resources :solos
  devise_for :users , :skip => [:registrations, :passwords]   

  resources :users, except: [:new, :create, :destroy]
end
