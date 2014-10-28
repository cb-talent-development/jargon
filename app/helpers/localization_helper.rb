module LocalizationHelper
  def localization
    @localization ||= Localization.find(params[:id])
  end

  def redirect_to_localization
    redirect_to localization_path(localization), status: :see_other
  end
end
