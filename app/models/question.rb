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

class Question < ActiveRecord::Base
  belongs_to :category
  validates :name, presence: true
end
