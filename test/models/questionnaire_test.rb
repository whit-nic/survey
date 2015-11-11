# == Schema Information
#
# Table name: questionnaires
#
#  id         :integer          not null, primary key
#  ip         :inet
#  data       :hstore
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_questionnaires_on_data  (data)
#

require 'test_helper'

class QuestionnaireTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
