class LocalizationsController < ApplicationController
  def index
    @localizations = Localization.all
  end
end
