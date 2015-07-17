class Gender < ActiveRecord::Base
  has_one :user_type
end
