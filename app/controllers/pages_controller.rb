class PagesController < ApplicationController
  def index
  end

  def search
  end

  def show_all_qs
    artists_array = params[:new_artist] || nil

    location = params[:location] || 'sydney'

    @events = Event.fetch_by_artist artists_array, location

    render 'events/show_all'
  end

end
