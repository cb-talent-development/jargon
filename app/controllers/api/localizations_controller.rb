module Api
  class LocalizationsController < APIController
    include LocalizationHelper
    doorkeeper_for :all, except: :lookup_by_uuid

    def index
      @localizations = Localization.all
      respond_with @localizations
    end

    def show
      find_localization!
      respond_with @localization
    end

    def create
      @localization = Localization.new(localization_params)
      @localization.owner = User.find_by_id(doorkeeper_token.resource_owner_id)
      @localization.save!
      render json: @localization
    end

    def update
      find_localization!
      @localization.update!(localization_params)
      render json: @localization
    end

    def destroy
      find_localization!
      @localization.destroy!
      render json: @localization
    end

    def lookup_by_uuid
      @localization = Localization.find_by_uuid!(params[:uuid])
      respond_with @localization
    end

    private

    def localization_params
      params.require(:localization).permit(:name)
    end
  end
end
