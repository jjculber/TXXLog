class LogEntriesController < ApplicationController
  # before_filter :authenticate_user!

  def index
  end

  def new
  end
  
  def create
  end

  def edit
    @log_entry = LogEntry.find(params[:id])
    @log_entry.contact_at ||= @log_entry.created_at
  end

  def update
    @log_entry = LogEntry.find(params[:id])
    @log_entry.update(log_entry_params)
    redirect_to event_path(@log_entry.event_id)
  end
  
  def show
    @log_entry = LogEntry.find(params[:id])
  end

  def destroy
    @log_entry = LogEntry.find(params[:id])
    @log_entry.update(deleted: true)
    redirect_to event_path(@log_entry.event_id)
  end

  private
  def log_entry_params
    params.require(:log_entry).permit(:callsign, :category, :section, :frequency, :mode, :contact_at)
  end
end
