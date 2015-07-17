class UserType < ActiveRecord::Base
  has_many :users
  belongs_to :generation
  belongs_to :gender

  has_many :category_user_types
  has_many :categories, through: :category_user_types
end
