class Movie < Item
  validates :title, presence: true
  validates :plot, presence: true

  scope :list, -> { order(created_at: :desc)}
end
