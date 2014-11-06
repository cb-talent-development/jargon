class Locale < ActiveRecord::Base
  require 'yaml'
  serialize :data
  belongs_to :localization
  belongs_to :owner, class_name: User, foreign_key: 'user_id'

  validates_uniqueness_of :locale, scope: :localization_id

  def yaml
    data.to_yaml
  end

  def yaml= p
    self.data = YAML.load(p)
  end
end
