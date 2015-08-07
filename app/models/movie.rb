class Movie < Item
  validates :title, presence: true
  validates :plot, presence: true
end
