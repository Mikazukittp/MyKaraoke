class Category < ActiveRecord::Base
  has_many :category_user_types
  has_many :user_types, through: :category_user_types

  has_many :category_songs
  has_many :songs, through: :category_songs

  has_many :scores

end
