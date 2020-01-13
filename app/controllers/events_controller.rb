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

  def log_contact
    @event = Event.find(params[:id])
    r = @event.log_entries.create(log_params)
    puts r.errors.full_messages
    puts r.persisted?

    redirect_to event_path(@event)
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)

    redirect_to edit_event_path(@event)
  end
  
  def show
    @event = Event.find(params[:id])
    last_event = @event.log_entries.last
    @log_entry = @event.log_entries.new(frequency: last_event.try(:frequency), mode: last_event.try(:mode))
  end

  def stats
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

  def log_params
    params.require(:log_entry).permit(:contact_at, :callsign, :category, :section,
      :station_id, :user_id, :frequency, :mode, :deleted)
  end
end
