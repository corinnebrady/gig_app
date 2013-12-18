class PagesController < ApplicationController
  def index
  end

  def search
  end

  def show_all_qs
    artists_array = params[:artists] ? params[:artists].split(/[, ]+/) : nil

    location = params[:location] || 'sydney'

    @events = Event.fetch_by_artist artists_array, location
    # do i need to run an if statement to see if they input an artist?
  end

end
