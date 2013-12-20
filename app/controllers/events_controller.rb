class EventsController < ApplicationController


  def show
    @event = Event.find params[:id]
  end

  def show_all
    if (current_user.events.empty? || current_user.events.order(:created_at).last.try(:created_at) < 12.hour.ago)
      Event.fetch_by_user(current_user)
    end
    @events = current_user.events.order(:date)
  end



end
