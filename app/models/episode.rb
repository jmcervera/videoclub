class Episode < ActiveRecord::Base
  belongs_to :season

  validates :number,
      presence: true,
      numericality: {only_integer: true},
      uniqueness: {scope: :season_id}

  validates :title, presence: true
  validates :plot, presence: true
end
