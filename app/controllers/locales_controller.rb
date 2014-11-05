class LocalesController < ApplicationController
  include LocalizationHelper
  doorkeeper_for :index, :show, scopes: [:public]
  doorkeeper_for :create, :update, :destroy, scopes: [:write, :update]

  def index
    respond_with localization.list_locales
  end

  def show
    respond_with localization.retrieve_locale params[:locale]
  end

  def create
    @locale = localization.locales.new(locale: params[:locale], data: params[:data])
    localization.save!
    redirect_to locale_localization_path(localization, @locale.locale)
  end

  def update
    locale.data = params[:data]
    locale.save!
    redirect_to locale_localization_path(localization, locale.locale), status: :see_other
  end

  def destroy
    locale.destroy!
    redirect_to locales_localization_path(localization), status: :see_other
  end
end
