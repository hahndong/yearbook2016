Rails.application.routes.draw do
  root 'solos#index'
  get 'groups/typeahead.json' => 'groups#typeahead'
  resources :groups
  get 'solos/designs' => 'solos#designs'
  get 'solos/volunteer' => 'solos#volunteer'
  get 'solos/thankyou' => 'solos#thankyou'
  resources :solos
  devise_for :users , :skip => [:registrations, :passwords]   

  resources :users, except: [:new, :create, :destroy]
end
