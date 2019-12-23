class EventsController < ApplicationController
  # before_filter :authenticate_user!

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end
  
  def create
    @event = Event.new(event_params)
    @event.save
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
  end
  
  def show
    @event = Event.find(params[:id])
  end

  def export_log
    @event = Event.find(params[:id])
  end

  private
  def event_params
    params.require(:event).permit(:event_name, :callsign, :start_time, :end_time,
      :exchange, :location, :section, :category, :category_power,
      :wfd_bonus_offgrid, :wfd_bonus_outdoor, :wfd_bonus_remote,
      :wfd_bonus_satellite, :contact_name, :contact_address, :contact_city,
      :contact_state, :contact_postal_code, :contact_country, :contact_email)
  end
end
