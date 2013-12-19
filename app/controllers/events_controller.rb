class EventsController < ApplicationController


  def show
    @event = Event.find params[:id]
  end

  def show_all
    Event.fetch_by_user(current_user)

    @events = current_user.events.reverse
  end



end
