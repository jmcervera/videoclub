class Movie < ActiveRecord::Base
  validates :title, presence: true
  validates :plot, presence: true
end
