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

require 'spec_helper'

describe Artist do
  it { should belong_to :user }
  it { should have_and_belong_to_many :events }

  before do
    @artist = Artist.create :name => 'ArtistName'
  end

  it 'should have an email' do
    @artist.name.present? == true
  end

end
