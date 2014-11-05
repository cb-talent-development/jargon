Rails.application.routes.draw do
  devise_for :users
  namespace :api do
    resources :localizations, only: [:show, :index, :create, :update, :destroy], defaults: {format: :json} do
      member do
        post 'locales', to: "locales#create", as: nil
        get 'locales', to: "locales#index", as: :locales
        get ':locale', to: "locales#show", as: :locale
        put ':locale', to: "locales#update", as: nil
        delete ':locale', to: "locales#destroy", as: nil
      end
    end
  end

  scope :api do
    use_doorkeeper
  end

  get '/localizations', to: 'localizations#index'


  authenticated :user do
    root to: 'localizations#index', :as => :authenticated_root
  end
  root :to => redirect('/users/sign_in')
end
