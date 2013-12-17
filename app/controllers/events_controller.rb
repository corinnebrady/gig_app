class EventsController < ApplicationController

  # def index
  # end

  # def show
  #   @artist = Event.find params[:id]
  # end

  # def new
  # end

  # def create
  # end

  # def edit
  # end

  # def update
  # end

  # def destroy
  # end



  def index
    @event = Event.all
  end

  def show
    @event = Event.find params[:id]
  end

  def new
    @event = Event.new
  end

  def create
    @event= Event.new params[:event]
    if @event.save
      redirect_to event_path(@event.id)
    else
      render :new
    end
  end

  def edit
    @event= Event.find params[:id]
    render :edit
  end

  def update
    @event= Event.find params[:id]
    if @event.update_attributes params[:event]
      redirect_to event_path(@event.id)
    else
      render :edit
    end
  end

  def destroy
    event = Event.find params[:id]
    event.destroy
    redirect_to events_path
  end

end
