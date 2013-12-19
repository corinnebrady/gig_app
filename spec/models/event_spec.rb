# == Schema Information
#
# Table name: events
#
#  id              :integer          not null, primary key
#  venue           :string(255)
#  city            :string(255)
#  street          :string(255)
#  date            :datetime
#  tickets_website :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  artist_id       :integer
#  title           :string(255)
#  lastfm_id       :integer
#  artists         :text
#  headliner       :string(255)
#  description     :text
#  image           :text
#

require 'spec_helper'


describe Event do
  it { should have_and_belong_to_many :artists }

  before do
    @event = Event.create(:city => 'SomeCity')
  end

  it 'should have an email' do
    @event.city.present? == true
  end

end
