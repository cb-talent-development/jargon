Rails.application.routes.draw do
  devise_for :users
  scope :api do
    use_doorkeeper
    resources :localizations, only: [:show, :index, :create, :update, :destroy], defaults: {format: :json} do
      member do
        post 'locales', to: "localizations#create_locale", as: nil
        get 'locales', to: "localizations#index_locales", as: :locales
        get ':locale', to: "localizations#show_locale", as: :locale
        put ':locale', to: "localizations#update_locale", as: nil
        delete ':locale', to: "localizations#destroy_locale", as: nil
      end
    end
  end

  root to: "localizations#index", defaults: {format: :json}
end
