class Song < ActiveRecord::Base
  attr_accessor :like

  has_many :category_songs, dependent: :destroy
  has_many :categories, through: :category_songs

  has_many :scores, dependent: :destroy

  belongs_to :artist
end
