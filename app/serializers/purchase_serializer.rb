class PurchaseSerializer < ActiveModel::Serializer
  cache key: 'purchase'
  attributes :id, :user_id, :item_id, :purchased_at, :expire_at
end
