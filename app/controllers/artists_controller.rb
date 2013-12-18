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
    Event.fetch( User.first )
    # raise params.inspect
  end

end
























