class Season < ActiveRecord::Base
  has_many :episodes

  validates :title, presence: true
  validates :plot, presence: true
end
