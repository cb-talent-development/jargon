module Api
  class LocalizationsController < APIController
    include LocalizationHelper
    doorkeeper_for :index, :show, scopes: [:public]
    doorkeeper_for :create, :update, :destroy, scopes: [:write, :update]

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
      @localization.owner = User.find(doorkeeper_token.resource_owner_id)
      @localization.save!
      redirect_to api_localization_path(@localization), status: :see_other
    end

    def update
      find_localization!
      @localization.update!(localization_params)
      render json: @localization
    end

    def destroy
      find_localization!
      @localization.destroy!
      redirect_to api_localizations_path, status: :see_other
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
