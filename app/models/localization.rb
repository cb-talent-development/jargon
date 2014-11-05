class Localization < ActiveRecord::Base
  has_many :locales, dependent: :destroy
  belongs_to :owner, class_name: User, foreign_key: 'user_id'

  validates :name, presence: true, uniqueness: true
  validates :owner, presence: true

  def list_locales
    locales.inject([]) { |memo, enum| memo << enum.locale }
  end

  def retrieve_locale locale
    locales.find { |item| item.locale === locale }
  end
end
