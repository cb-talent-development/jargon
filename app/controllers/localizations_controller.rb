class LocalizationsController < ApplicationController
  include LocalizationHelper
  def index
    @localizations = Localization.all
  end

  def show
    localization!
  end

  def new
    @localization = Localization.new
  end

  def edit
    localization!
  end
end
