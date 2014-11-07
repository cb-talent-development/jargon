class LocalesController < ApplicationController
  require 'yaml'
  include LocalizationHelper
  include ApplicationHelper

  def show
    @locale = Locale.find(params[:id])
    @localization = Localization.find(params[:localization_id])
  end

  def create
    @localization = Localization.find(params[:localization_id])
    @locale = @localization.locales.new(locale_params)
    @locale.owner = current_user
    if @localization.save
      redirect_to @localization
    else
      render :new
    end
  end

  def new
    @localization = Localization.find(params[:localization_id])
    @locale = @localization.locales.new
  end

  def update
    @locale = Locale.find(params[:id])
    @localization = Localization.find(params[:localization_id])
    @locale.update!(locale_params)
    redirect_to localization_locale_path(@localization, @locale)
  end

  def destroy
    @locale = Locale.find(params[:id])
    @localization = Localization.find(params[:localization_id])
    @locale.destroy!
    redirect_to @localization
  end
  
  private

  def locale_params
    params.require(:locale).permit(:locale, :data, :yaml)
  end
end
