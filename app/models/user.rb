class User < ApplicationRecord
  has_secure_password
  has_many :orders
  validates :email, presence:true, uniqueness: true
  validates :password, presence: true

  def to_token_payload
    {
      sub: id,
      email: email
    }
  end
end
