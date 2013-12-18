# == Schema Information
#
# Table name: artists
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Artist < ActiveRecord::Base
  attr_accessible :name, :user_id

  validates :name, :presence => true

  belongs_to :user
  has_many :events

end
