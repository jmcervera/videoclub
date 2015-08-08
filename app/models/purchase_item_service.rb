class PurchaseItemService

  ItemAlreadyBought = Class.new(StandardError)

  def perform(user_id, item_id)
    user = User.find(user_id)
    item = Item.find(item_id)
    unless user.library.include?(item)
      purchase = user.purchases.build
      purchase.item_id = item_id
      purchase.purchased_at = Time.current
      purchase.expire_at = purchase.purchased_at + 2.days
      purchase.save!
      purchase
    else
      raise ItemAlreadyBought.new("You have that already in your library")
    end
  end
end
