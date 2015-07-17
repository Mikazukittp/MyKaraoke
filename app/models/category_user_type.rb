class CategoryUserType < ActiveRecord::Base
  belongs_to :category
  belongs_to :user_type
end
