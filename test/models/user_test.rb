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

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(username: "air", name: "王钧",
                     password: "foobar", password_confirmation: "foobar")
  end
  # test "the truth" do
  #   assert true
  # end
end
