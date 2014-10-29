module LocalizationHelper
  def localization
    @localization ||= Localization.find(params[:id])
  end

  def locale
    @locale ||= Localization.find(params[:id]).retrieve_locale(params[:locale])
  end

  def redirect_to_localization
    redirect_to localization_path(localization), status: :see_other
  end

  def save_or_error obj
    begin
      obj.save!
      yield
    rescue
      render json: obj.errors.full_messages, status: :failed_dependency
    end
  end
end
