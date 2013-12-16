# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  venue      :string(255)
#  city       :string(255)
#  street     :string(255)
#  date       :datetime
#  website    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Event < ActiveRecord::Base
  attr_accessible :street, :city, :date, :venue, :website

  validates :city, :presence => true

  has_and_belongs_to_many :artists

end
