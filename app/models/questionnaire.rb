# == Schema Information
#
# Table name: questionnaires
#
#  id              :integer          not null, primary key
#  ip              :inet
#  data            :hstore
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  gender          :integer
#  grade           :integer
#  local           :integer
#  hope            :integer
#  learn_status    :integer
#  edu             :integer
#  income          :integer
#  school          :string
#  position        :integer
#  school_position :integer
#  known           :integer
#
# Indexes
#
#  index_questionnaires_on_data  (data)
#

require 'csv'

class Questionnaire < ActiveRecord::Base
  validates :school,  presence: true
  scope :where_any, ->(key, value) { where("data @> hstore(?, ?)", key, value) }

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << first.data.keys
      all.each do |survey|
        csv << survey.data.values
      end
    end
  end
end
