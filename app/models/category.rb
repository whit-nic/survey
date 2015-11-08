# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  order_no   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ActiveRecord::Base
  validates :name,  presence: true
  validates :order_no, numericality: { only_integer: true }, uniqueness: true
  has_many :questions
  accepts_nested_attributes_for :questions, reject_if: :all_blank, allow_destroy: true
end
