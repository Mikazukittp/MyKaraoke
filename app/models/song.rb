class Song < ActiveRecord::Base
  has_many :category_songs, dependent: :destroy
  has_many :categories, through: :category_songs

  has_many :scores, dependent: :destroy
end
