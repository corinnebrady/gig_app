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

  def update_all
    # Handle new artists
    if params[:new_artist].present?
      params[:new_artist].each do |artist|
        Artist.create(:name => artist, :user_id => current_user.id)
      end
    end

    # Handle updates
    if params[:artist].present?
      params[:artist].each do |id, artist|
        a = Artist.find id
        if artist.nil? || artist == ''
          a.destroy
        else
          a.name = artist
          a.save
        end
      end
    end
    Event.fetch_by_user(current_user)
    redirect_to events_show_all_path
  end

  def destroy
    artist = Artist.find params[:id]
    artist.destroy
    redirect_to artists_path
  end


  def fetch
    Event.fetch( User.first )
    # raise params.inspect
  end

end
























