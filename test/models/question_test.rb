# == Schema Information
#
# Table name: questions
#
#  id          :integer          not null, primary key
#  name        :string
#  field_type  :string
#  category_id :integer
#  required    :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_questions_on_category_id  (category_id)
#

require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
