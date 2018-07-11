# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  validates :password_digest, length: {minimum: 5}, presence: true
  validates :username, :session_token, presence: true

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def password_digest_presence
    errors[:password_digest] << "password can't be blank" << if password_digest.length == 0
  end
end
