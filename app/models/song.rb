class Song < ActiveRecord::Base
  has_many :category_songs
  has_many :categories, through: :category_songs

  has_many :scores
end
