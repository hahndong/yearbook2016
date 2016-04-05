Rails.application.routes.draw do
  root 'statics#landing_page'
  get '/email_invit' => 'statics#email_invit'
  get '/pricing' => 'statics#pricing'
  get '/design' => 'statics#design'
  get 'groups/typeahead.json' => 'groups#typeahead'
  resources :groups

  get 'solos/designs' => 'solos#designs'
  get 'solos/:id/large' => 'solos#large'
  get 'solos/indexprint' => 'solos#indexprint'
  get 'solos/volunteer' => 'solos#volunteer'
  get 'solos/thankyou' => 'solos#thankyou'
  resources :solos
  get 'users/auth' => 'users#auth'

  devise_for :users , :skip => [:registrations, :passwords]   
  get 'users/export' => 'users#users_export'
  get 'users/sent_invit' =>'users#send_invit', defaults: { :format => 'js' }
  resources :users, except: [:new, :create, :destroy]
end
