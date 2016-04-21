# == Schema Information
#
# Table name: schools
#
#  id          :integer          not null, primary key
#  name        :string
#  province_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_schools_on_province_id  (province_id)
#

class School < ActiveRecord::Base
  belongs_to :province
  validates_presence_of :name, :province_id
end
