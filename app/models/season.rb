class Season < Item
  has_many :episodes, dependent: :delete_all

  validates :title, presence: true
  validates :plot, presence: true
end
