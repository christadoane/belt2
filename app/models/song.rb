class Song < ActiveRecord::Base
  belongs_to :user
  has_many :playlists, dependent: :destroy
  validates :title, :artist, :presence => true
  validates :title, :artist, length: { minimum: 2 }
end
