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
#  artist_id  :integer
#  title      :string(255)
#

class Event < ActiveRecord::Base
  attr_accessible :street, :city, :date, :venue, :website, :artist_id, :title

  validates :city, :presence => true

  belongs_to :artist


  # Event.fetch_for_user current_user
  def self.fetch_for_user(user)
    # user_artists = user.artists.map &:name
    # Code below is not longer necessary but it is how you create a hash from an array with all values equal to true
    # @artists_hash = Hash[*artists_array.map {|x| [x, nil]}.flatten]

    # FIX THIS!!!
    @location = 'sydney' # find the user's location (user.location)


    url = "http://ws.audioscrobbler.com/2.0/?method=geo.getevents&location=#{@location}&api_key=d5457080d2066b9f7a7da03055cc8181&format=json"

    @events = HTTParty.get url
    # @events = JSON @events_data
    # raise params.inspect

    events_by_artist = {}

    @events['events']['event'].each do |event|
      artists = event['artists']['artist']
      if artists.kind_of? String
        events_by_artist[ artists ] ||= [] # the first instance of that artist will set up the array
        events_by_artist[ artists ].push event # subsequent instances of that artist will add events withint that above array
      else
        artists.each do |artist|
          events_by_artist[ artist ] ||= []
          events_by_artist[ artist ].push event
        end
      end
    end

    user.artists.each do |artist|
      if events_by_artist[artist.name]
        # Create each event
        events_by_artist[artist.name].each do |event|
          Event.create({
            :title => event['title'],
            :street => event['venue']['location']['street'],
            :city => event['venue']['location']['city'],
            :date => event['venue']['name'],
            :venue => event['venue']['name'],
            :website => event['venue']['website'],
            :artist_id => artist.id
          })
        end
      end


    # make sure not to duplicate <--- still need to do this? There WILL be du

    end


    # lastfm = Lastfm.new('d5457080d2066b9f7a7da03055cc8181', 'ce00c617001acbe8df65bbd0523f131e')
    # token = lastfm.auth.get_token
    # lastfm.session = lastfm.auth.get_session(:token => token)['key']
  end

  # @events = Event.fetch_by_artist(['Making', 'Dappled Cities'], 'Sydney')
  def self.fetch_by_artist(artists, location)
    # user_artists = user.artists.map &:name
    # Code below is not longer necessary but it is how you create a hash from an array with all values equal to true
    # @artists_hash = Hash[*artists_array.map {|x| [x, nil]}.flatten]

    url = "http://ws.audioscrobbler.com/2.0/?method=geo.getevents&location=#{location}&api_key=d5457080d2066b9f7a7da03055cc8181&format=json"

    @events = HTTParty.get url
    # @events = JSON @events_data
    # raise params.inspect

    events_by_artist = {}

    @events['events']['event'].each do |event|
      artists = event['artists']['artist']
      if artists.kind_of? String
        events_by_artist[ artists ] ||= [] # the first instance of that artist will set up the array
        events_by_artist[ artists ].push event # subsequent instances of that artist will add events withint that above array
      else
        artists.each do |artist|
          events_by_artist[ artist ] ||= []
          events_by_artist[ artist ].push event
        end
      end
    end

    matched_events = []
    artists.each do |artist|
      if events_by_artist[artist]
        # Create each event
        events_by_artist[artist].each do |event|
          event = Event.new({
            :title => event['title'],
            :street => event['venue']['location']['street'],
            :city => event['venue']['location']['city'],
            :date => event['venue']['name'],
            :venue => event['venue']['name'],
            :website => event['venue']['website'],
          })
          matched_events.push(event)
        end
      end
    end
    matched_events
  end


end
