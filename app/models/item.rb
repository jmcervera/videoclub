class Item < ActiveRecord::Base
  scope :list, -> { order(created_at: :desc)}
end
