Rails.application.routes.draw do
  
  devise_for :users
  
  devise_scope :user do
    get 'register', to: 'devise/registrations#new'
    get 'login', to: 'devise/sessions#new'
    delete 'logout', to: 'devise/sessions#destroy'
  end
  
  root 'punchcards#index'

  resources :punchcards do
    resources :records
  end
  
  get 'search_record', to: 'records#search_record'
  get 'records', to: 'punchcards#records'

end
