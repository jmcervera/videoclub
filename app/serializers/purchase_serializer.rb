class PurchaseSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :item_id, :purchased_at, :expire_at
end
