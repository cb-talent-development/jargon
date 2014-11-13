module Api
  class LocalesController < APIController
    include LocalizationHelper
    doorkeeper_for :index, :show, scopes: [:public]
    doorkeeper_for :create, :update, :destroy, scopes: [:write, :update]

    def index
      find_localization!
      respond_with @localization.list_locales
    end

    def show
      find_locale!
      respond_with @locale
    end

    def create
      find_locale!
      @localization.save!
      redirect_to locales_api_localization_path(@localization), format: :json
    end

    def update
      find_locale!
      @locale.update!(locale_params)
      redirect_to locale_api_localization_path(@localization, @locale.name), status: :see_other
    end

    def destroy
      find_locale!
      @locale.destroy!
      redirect_to locales_api_localization_path(@localization), status: :see_other
    end

    def lookup_by_uuid
      @localization = Localization.find_by_uuid(params[:uuid])
      @locale = @localization.locales.find_by_name params[:locale_name]
      respond_with @locale
    end

    private

    def locale_params
      params.require(:locale).permit(:name, :json)
    end

    def find_localization!
      @localization ||= Localization.find_by_id!(params[:id])
    end

    def find_locale!
      find_localization!
      @locale ||= Locale.find_by_name!(params[:locale_name])
    end
  end
end
