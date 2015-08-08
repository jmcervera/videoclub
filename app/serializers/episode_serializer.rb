class EpisodeSerializer < ActiveModel::Serializer
  cache key: 'episode'
  attributes :id, :number, :title, :plot
end
