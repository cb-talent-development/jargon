class LocaleSerializer < ActiveModel::Serializer
  attributes :id, :name, :json, :created_at, :updated_at
end
