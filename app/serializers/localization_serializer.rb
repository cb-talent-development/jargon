class LocalizationSerializer < ActiveModel::Serializer
  attributes :id, :name, :created_at, :updated_at

  has_many :localized_datas
end
