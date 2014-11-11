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
      @localization = Localization.find(params[:id])
      respond_with @localization
    end

    def create
      @localization = Localization.new(name: params[:localization][:name])
      @localization.owner = User.find(doorkeeper_token.resource_owner_id)
      @localization.save!
      redirect_to_localization
    end

    def update
      @localization = Localization.find(params[:id])
      @localization.name = params[:localization][:name]
      @localization.save!
      redirect_to_localization
    end

    def destroy
      @localization = Localization.find(params[:id])
      @localization.destroy!
      redirect_to localizations_path, status: :see_other
    end

    def lookup_by_uuid
      @localization = Localization.find_by_uuid(params[:uuid])
      respond_with @localization
    end
  end
end
