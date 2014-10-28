class Localization < ActiveRecord::Base
  has_many :localized_datas
  validates :name, presence: true, uniqueness: true
end
