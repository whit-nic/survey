# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string
#  name            :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_username  (username) UNIQUE
#

class User < ActiveRecord::Base
  before_save { self.username = username.downcase }
  validates :username,  presence: true, length: { maximum: 50 }, uniqueness: true
  has_secure_password
end
