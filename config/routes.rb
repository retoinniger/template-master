Rails.application.routes.draw do
  
  root to: 'index#index'
  
  devise_for :users, controllers: {confirmations: 'user/confirmations',
                                   passwords:     'user/passwords',
                                   registrations: 'user/registrations',
                                   sessions:      'user/sessions',
                                   unlocks:       'user/unlocks'}
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
