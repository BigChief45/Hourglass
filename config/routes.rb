Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }

  devise_scope :user do
    get 'register', to: 'devise/registrations#new'
    get 'login', to: 'devise/sessions#new'
    delete 'logout', to: 'devise/sessions#destroy'
  end

  resources :punchcards do
    resources :records do
      get 'search', on: :collection
    end
  end

  get 'today', to: 'records#today'

  root 'punchcards#index'

end
