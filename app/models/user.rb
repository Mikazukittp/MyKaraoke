class User < ActiveRecord::Base
  has_many :scores
  belongs_to :user_type

  def new_token
    s = SecureRandom.base64(24)
    s[0, if s.size > 32 then 32 else s.size end]
    self.token = s
  end
end
