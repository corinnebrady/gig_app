class EventsController < ApplicationController


  def show
    @event = Event.find params[:id]
  end

  def show_all
    #below: Show_all will not check the api everytime, instead it will either call it if it hasn't been refreshed in over 12 hours OR if a new artist has been added within the last 12 hours
    if (current_user.events.empty? || current_user.events.order(:created_at).last.try(:created_at) < 12.hour.ago)
      Event.fetch_by_user(current_user)
    end
    @events = current_user.events.order(:date)
  end



end
