class ArtistsController < ApplicationController

  def index
    @artist = Artist.all
  end

  def show
    @artist = Artist.find params[:id]
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist= Artist.new params[:artist]
    # @artist.user = @current_user
    if @artist.save
      redirect_to artist_path(@artist.id)
    else
      render :new
    end
  end

  def edit
    @artist= Artist.find params[:id]
    render :edit
  end

  def update
    @artist= Artist.find params[:id]
    if @artist.update_attributes params[:artist]
      redirect_to artist_path(@artist.id)
    else
      render :edit
    end
  end

  def destroy
    artist = Artist.find params[:id]
    artist.destroy
    redirect_to artists_path
  end



  def fetch
    # FIX THIS!!!
    user.artists = ["Mac DeMarco", "Scotdrakula", "Elvis", "Ben David"]

    artists_array = user.artists
    artists_hash = Hash[*artists_array.map {|x| [x, nil]}.flatten]

    # FIX THIS!!!
    @location = 'sydney' # find the user's location (user.location)

    url = "http://ws.audioscrobbler.com/2.0/?method=geo.getevents&location=#{@location}&api_key=d5457080d2066b9f7a7da03055cc8181&format=json"

    @events_data = HTTParty.get url
    @events = JSON @events_data
    # raise params

    # lastfm = Lastfm.new('d5457080d2066b9f7a7da03055cc8181', 'ce00c617001acbe8df65bbd0523f131e')
    # token = lastfm.auth.get_token

    # lastfm.session = lastfm.auth.get_session(:token => token)['key']

      # events = lastfm.geo.get_events(:location => 'Sydney')
      # events.each do |event| #might need to be events.data.each (check out params)
      #   Event.create(event) # except more better
      # find artist
          # attach it to specific artist
      # make sure not to duplicate

      # end
      # raise params.inspect
  end

end
























