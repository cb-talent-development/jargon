module Api
  class LocalesController < APIController
    include LocalizationHelper
    doorkeeper_for :index, :show, scopes: [:public]
    doorkeeper_for :create, :update, :destroy, scopes: [:write, :update]

    def index
      respond_with localization!.list_locales
    end

    def show
      respond_with localization!.retrieve_locale params[:locale]

    end

    def create
      @locale = localization!.locales.new(locale: params[:locale], json: params[:json])
      localization!.save!
      redirect_to locales_api_localization_path(localization!, @locale.locale)
    end

    def update
      @locale = Locale.find(params[:locale])
      @locale.update!(params.require(:local, :json))
      redirect_to locale_localization_path(localization!, locale.locale), status: :see_other
    end

    def destroy
      locale.destroy!
      redirect_to locales_localization_path(localization!), status: :see_other
    end

    def lookup_by_uuid
      @localization = Localization.find_by_uuid(params[:uuid])
      @locale = @localization.retrieve_locale(params[:uuid])
      respond_with @locale
    end

    private

    def locale_params
      params.require(:locale).permit(:locale, :json)
    end
  end
end
