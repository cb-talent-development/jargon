module Api
  class LocalizationsController < APIController
    include LocalizationHelper
    # doorkeeper_for :index, :show, scopes: [:public]
    # doorkeeper_for :create, :update, :destroy, scopes: [:write, :update]

    def index
      @localizations = Localization.all
      respond_with @localizations
    end

    def show
      respond_with localization!
    end

    def create
      @localization = Localization.new(name: params[:name])
      localization!.save!
      redirect_to_localization
    end

    def update
      localization.name = params[:name]
      localization.save!
      redirect_to_localization
    end

    def destroy
      localization.destroy!
      redirect_to localizations_path, status: :see_other
    end
  end
end