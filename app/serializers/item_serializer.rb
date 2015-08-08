class ItemSerializer < ActiveModel::Serializer
  cache key: 'item'
  attributes :id, :type, :title, :plot
end
