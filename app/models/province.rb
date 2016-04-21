# == Schema Information
#
# Table name: provinces
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Province < ActiveRecord::Base
  has_many :schools
  validates_presence_of :name
end
