class LocalizationsController < ApplicationController
  include LocalizationHelper
  def index
    @localizations = Localization.all
  end

  def show
    @localization = Localization.find(params[:id])
  end

  def new
    @localization = Localization.new
  end

  def create
    @localization = Localization.new(localization_params)
    @localization.owner = current_user
    if @localization.save
      redirect_to @localization
    else
      render :new
    end
  end

  def edit
    @localization = Localization.find(params[:id])
  end

  def update
    @localization = Localization.find(params[:id])
    @localization.update(localization_params)
    redirect_to @localization
  end

  def destroy
    @localization = Localization.find(params[:id])
    @localization.destroy
    redirect_to localizations_path
  end

  private

  def localization_params
    params.require(:localization).permit(:name)
  end
end
