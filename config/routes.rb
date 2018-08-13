Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }

  devise_scope :user do
    get 'register', to: 'devise/registrations#new'
    get 'login', to: 'devise/sessions#new'
    delete 'logout', to: 'devise/sessions#destroy'
    get 'settings', to: 'devise/registrations#edit'
  end

  resources :punchcards do
    resources :records do
      get 'search', on: :collection
    end
  end

  get 'today', to: 'records#today'

  root 'punchcards#index'

  # Error Pages
  match '/404', :to => 'errors#not_found', :via => :all
  match '/500', :to => 'errors#internal_server_error', :via => :all
  match '/403', :to => 'errors#forbidden', :via => :all

  # Static Pages
  get 'pricing', to: 'home#pricing'

end
