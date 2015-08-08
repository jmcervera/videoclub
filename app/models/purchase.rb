class Purchase < ActiveRecord::Base
  belongs_to :user
  belongs_to :item

  validates_presence_of :user, :item

  scope :alive, -> {
    where("expire_at > :now and purchased_at <= :now", now: Time.current)
  }
end
