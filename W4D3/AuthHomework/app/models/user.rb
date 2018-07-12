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
  attr_reader :password
  validates :password_digest, presence {message: 'Password can\'t be blank'}
  validates :password, length: {minimum: 6, allow_nil: true}
  validates :username, :session_token, presence: true

  def self.find_by_credentials(username, password)
    User.find_by(username: username)
  end

  def self.genereate_session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def password_digest_presence
    errors[:password_digest] << "password can't be blank" << if password_digest.length == 0
  end

  def reset_session_token!
  end

  def ensure_session_token
  end
end
