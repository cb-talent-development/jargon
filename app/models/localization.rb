class Localization < ActiveRecord::Base
  has_many :locales, dependent: :destroy
  belongs_to :owner, class_name: User, foreign_key: 'user_id'

  before_save :generate_uuid, unless: :uuid?

  validates :name, presence: true, uniqueness: true
  validates :owner, presence: true

  def list_locales
    locales.inject([]) { |memo, enum| memo << enum.name }
  end

  alias_method :available_locales, :list_locales

  def uuid?
    uuid != nil
  end

  private

  def generate_uuid
    self.uuid = SecureRandom.uuid
  end
end
