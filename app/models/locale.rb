class Locale < ActiveRecord::Base
  belongs_to :localization
  validates_uniqueness_of :locale, scope: :localization_id
end
