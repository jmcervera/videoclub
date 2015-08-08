class User < ActiveRecord::Base
  has_many :purchases
  has_many :items, through: :purchases

  validates :email, presence: true, uniqueness: true

  def library
    items.merge(Purchase.alive)
  end
end
