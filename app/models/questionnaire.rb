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
  scope :where_any, ->(key, value) { where("data @> hstore(?, ?)", key, value) }
  validate :validate_data
  validates_presence_of :gender, :grade, :local, :hope, :learn_status, :edu,
                        :income, :school, :school, :position, :school_position, :known

  def self.to_csv(options = {})
    output = CSV.generate(options) do |csv|
      if last.present? && last.data.present?
        basic_info_header = new.attributes.keys - ["id", "ip", "data", "created_at", "updated_at"]
        header = ["ID", "IP", "投票时间"] + last.data.keys + basic_info_header
        csv <<  header
        all.each do |survey|
          content = [survey.id, survey.ip, survey.created_at] + survey.data.values + [survey.gender, survey.grade, survey.local, survey.hope,
                  survey.learn_status, survey.edu, survey.income, survey.school,
                  survey.position, survey.school_position, survey.known]
          csv << content
        end
      end
    end
  end

  def validate_data
    if data.present?
      Question.all.each do |question|
        if data[question.question_no].blank?
          errors.add question.name, "不能为空字符。"
        end
      end
    else
      errors[:base] << "没有回答任何调查问题。"
    end
  end

end
