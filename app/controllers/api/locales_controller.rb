module Api
  class LocalesController < APIController
    include LocalizationHelper
    doorkeeper_for :all, except: :lookup_by_uuid

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
      logger.debug locale_params
      @locale.update!(locale_params)
      render json: @locale
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


  end
end
