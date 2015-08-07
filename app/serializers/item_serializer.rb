class ItemSerializer < ActiveModel::Serializer
  root :item
  attributes :id, :type, :title, :plot
end
