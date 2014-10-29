class LocalizationsController < APIController
  include LocalizationHelper

  def index
    @localizations = Localization.all
    respond_with @localizations
  end

  def show
    respond_with localization
  end

  def create
    @localization = Localization.new(name: params[:name])
    save_or_error @localization do
      redirect_to_localization
    end
  end

  def update
    localization.name = params[:name]
    save_or_error localization do
      redirect_to_localization
    end
  end

  def destroy
    localization.destroy!
    redirect_to localizations_path, status: :see_other
  end

  ## Locale info

  def index_locales
    respond_with localization.list_locales
  end

  def show_locale
    respond_with localization.retrieve_locale params[:locale]
  end

  def create_locale
    @locale = localization.locales.new(locale: params[:locale], data: params[:data])
    begin
      localization.save!
      redirect_to locale_localization_path(localization, @locale.locale)
    rescue
      render json: locale.errors.full_messages, status: :failed_dependency
    end
  end

  def update_locale
    locale.data = params[:data]
    save_or_error locale do
      redirect_to locale_localization_path(localization, locale.locale), status: :see_other
    end
  end

  def destroy_locale
    begin
      locale.destroy!
      redirect_to locales_localization_path(localization), status: :see_other
    rescue
      render json: {}, status: :not_found
    end
  end
end
