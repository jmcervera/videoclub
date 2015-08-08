class SeasonSerializer < ActiveModel::Serializer
  cache key: 'season'
  attributes :id, :title, :plot
  has_many :episodes
end
