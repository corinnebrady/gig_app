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

class Event < ActiveRecord::Base
  attr_accessible :street, :city, :date, :venue, :website, :artist_id, :title, :lastfm_id, :artists, :headliner, :description, :image, :tickets_website

  validates :city, :presence => true

  belongs_to :artist


  def self.fetch_by_user(user)
    # Code below is not longer necessary but it is how you create a hash from an array with all values equal to true
    # @artists_hash = Hash[*artists_array.map {|x| [x, nil]}.flatten]

    # location = current_user.location
    location = 'sydney'
    url = "http://ws.audioscrobbler.com/2.0/?method=geo.getevents&location=#{location}&api_key=d5457080d2066b9f7a7da03055cc8181&format=json&limit=200"
    @events = HTTParty.get url

    events_by_artist = {}
    @events['events']['event'].each do |event|
      artists = event['artists']['artist']
      if artists.kind_of? String
        events_by_artist[ artists.downcase ] ||= [] # the first instance of that artist will set up the array
        events_by_artist[ artists.downcase ].push event # subsequent instances of that artist will add events withint that above array
      else
        artists.each do |artist|
          events_by_artist[ artist.downcase ] ||= []
          events_by_artist[ artist.downcase ].push event
        end
      end
    end

    user.artists.each do |artist|
      if events_by_artist[artist.name.downcase]
        # Create each event
        events_by_artist[artist.name.downcase].each do |event|
          Event.create({
            :title => event['title'],
            :street => event['venue']['location']['street'],
            :city => event['venue']['location']['city'],
            :date => Date.parse(event['startDate']),
            :venue => event['venue']['name'],
            :website => event['website'],
            :artist_id => artist.id,
            :lastfm_id =>event['id'],
            :artists => event['artists']['artist'].respond_to?(:join) ? event['artists']['artist'].join('<br>')
                                                                       : event['artists']['artist'],
            :headliner => event['artists']['headliner'],
            :description => event['description'],
            :image => event['image'][3]['#text']
          })
        end
      end
    end
  end




  def self.fetch_by_artist(artist_names, location)
    url = "http://ws.audioscrobbler.com/2.0/?method=geo.getevents&location=#{location}&api_key=d5457080d2066b9f7a7da03055cc8181&format=json&limit=200"
    @events = HTTParty.get url

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
    if artist_names.nil?
      events_by_artist.keys.each do |artist|
        events_by_artist[artist].each do |event|
          event = Event.new({
            :title => event['title'],
            :street => event['venue']['location']['street'],
            :city => event['venue']['location']['city'],
            :date => Date.parse(event['startDate']),
            :venue => event['venue']['name'],
            :website => event['website'],
            :lastfm_id =>event['id'],
            :artists => event['artists']['artist'].respond_to?(:join) ? event['artists']['artist'].join(', ')
                                                                       : event['artists']['artist'],
            :headliner => event['artists']['headliner'],
            :description => event['description'],
            :image => event['image'][3]['#text']
          })
          matched_events.push(event)
        end
      end
    else
      artist_names.each do |artist|
        if events_by_artist[artist]
          # Create each event
          events_by_artist[artist].each do |event|
            event = Event.new({
              :title => event['title'],
              :street => event['venue']['location']['street'],
              :city => event['venue']['location']['city'],
              :date => Date.parse(event['startDate']),
              :venue => event['venue']['name'],
              :website => event['website'],
              :lastfm_id =>event['id'],
              :artists => event['artists']['artist'].respond_to?(:join) ? event['artists']['artist'].join(', ')
                                                                         : event['artists']['artist'],
              :headliner => event['artists']['headliner'],
              :description => event['description'],
              :image => event['image'][3]['#text']
            })
            matched_events.push(event)
          end
        end
      end
    end
    matched_events
  end
end
