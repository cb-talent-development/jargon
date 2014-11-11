module Api
  class LocalesController < APIController
    include LocalizationHelper
    doorkeeper_for :index, :show, scopes: [:public]
    doorkeeper_for :create, :update, :destroy, scopes: [:write, :update]

    def index
      @localization = Localization.find(params[:id])
      respond_with @localization.list_locales
    end

    def show
      @localization = Localization.find(params[:id])
      respond_with @localization.locales.find_by_name params[:locale_name]
    end

    def create
      @localization = Localization.find(params[:id])
      @locale = @localization.locales.new(locale_params)
      @localization.save!
      redirect_to locales_api_localization_path(@localization, @locale.name)
    end

    def update
      @localization = Localization.find(params[:id])
      @locale = @localization.locales.find_by_name params[:locale_name]
      @locale.update!(locale_params)
      redirect_to locale_api_localization_path(@localization, @locale.name), status: :see_other
    end

    def destroy
      @localization = Localization.find(params[:id])
      @locale = @localization.locales.find_by_name params[:locale_name]
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
