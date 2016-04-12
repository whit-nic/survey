# == Schema Information
#
# Table name: corps
#
#  id         :integer          not null, primary key
#  q1         :string
#  q2         :integer
#  q3         :integer
#  q4         :integer
#  q5         :integer
#  q6         :integer
#  q7         :integer
#  q8         :integer
#  q9         :integer
#  q10        :integer
#  q11        :integer
#  q12        :integer
#  q13        :integer
#  q14        :integer
#  q15        :integer
#  q16        :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  ip         :inet
#

class Corp < ActiveRecord::Base
  validates_presence_of :q1, :q2, :q3, :q4, :q5, :q6, :q7, :q8, :q9, :q10,
                        :q11, :q12, :q13, :q14, :q15, :q16

  def self.to_csv(options = {})
    output = CSV.generate(options) do |csv|
      header = ["ID", "IP", "投票时间", "q1", "q2", "q3","q4", "q5", "q6","q7",
                "q8", "q9","q10", "q11", "q12","q13", "q14", "q15","q16"]
      csv <<  header
      all.each do |corp|
        content = [corp.id, corp.ip, corp.created_at, corp.q1, corp.q2, corp.q3,
                   corp.q4, corp.q5, corp.q6, corp.q7, corp.q8, corp.q9, corp.q10,
                   corp.q11, corp.q12, corp.q13, corp.q14, corp.q15, corp.q16]
        csv << content
      end
    end
  end

end
