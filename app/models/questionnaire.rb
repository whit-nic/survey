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

class Questionnaire < ActiveRecord::Base
  scope :where_any, ->(key, value) { where("data @> hstore(?, ?)", key, value) }
end
