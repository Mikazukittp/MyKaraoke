class User < ActiveRecord::Base
  has_many :scores
  belongs_to :user_type
end
