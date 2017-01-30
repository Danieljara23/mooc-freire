# == Schema Information
#
# Table name: courses
#
#  id          :integer          not null, primary key
#  title       :string
#  autor       :integer
#  day         :integer
#  hour_range  :text
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Course < ApplicationRecord
  belongs_to :user
  serialize :hour_range

  validates :title, :description, presence: true
	validates :description,	length: { minimum: 20 }
end
