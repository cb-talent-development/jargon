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

  # get '/localizations/new', to: 'localizations#new', as: :new_localization
  # get '/localizations', to: 'localizations#index', as: :localizations
  # get '/localizations/:id', to: 'localizations#show', as: :localization
  # get '/localizations/:id/edit', to: 'localizations#edit', as: :edit_localization

  resources :localizations

  authenticated :user do
    root to: 'localizations#index', :as => :authenticated_root
  end
  root :to => redirect('/users/sign_in')
end
