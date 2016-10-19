class SongSerializer < ActiveModel::Serializer
  attributes :id, :title
  has_one :artist
  has_one :album
end
