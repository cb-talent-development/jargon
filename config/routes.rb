Rails.application.routes.draw do
  devise_for :users
  scope :api do
    use_doorkeeper
    resources :localizations, only: [:show, :index, :create, :update, :destroy], defaults: {format: :json} do
      member do
        post 'locales', to: "locales#create", as: nil
        get 'locales', to: "locales#index", as: :locales
        get ':locale', to: "locales#show_locale", as: :locale
        put ':locale', to: "locales#update_locale", as: nil
        delete ':locale', to: "locales#destroy_locale", as: nil
      end
    end
  end

  root to: 'application#index'
end
