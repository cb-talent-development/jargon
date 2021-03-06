module Api
  class LocalesController < APIController
    include LocalizationHelper
    doorkeeper_for :all, except: :lookup_by_uuid

    def index
      find_localization!
      respond_with @localization.locales
    end

    def show
      find_locale!
      respond_with @locale
    end

    def create
      find_localization!
      @locale = @localization.locales.new(locale_params)
      @localization.save!
      render json: @locale
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
      render json: @locale
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
