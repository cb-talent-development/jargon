class Localization < ActiveRecord::Base
  has_many :locales, dependent: :destroy
  validates :name, presence: true, uniqueness: true

  def list_locales
    locales.inject([]) { |memo, enum| memo << enum.locale }
  end

  def retrieve_locale locale
    locales.find { |item| item.locale === locale }
  end
end
