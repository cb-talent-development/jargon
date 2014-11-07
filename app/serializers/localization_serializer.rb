class LocalizationSerializer < ActiveModel::Serializer
  attributes :id, :name, :created_at, :updated_at, :available_locales

  has_many :locales
end
