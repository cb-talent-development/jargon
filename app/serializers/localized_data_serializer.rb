class LocalizedDataSerializer < ActiveModel::Serializer
  attributes :id, :locale, :data
end
