class EventsController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy ]

  def index
    @events = if params[:search]
                Event.where('name ILIKE ?', "%#{params[:search]}%")
              else
                Event.all
              end
  end

  def show
  end

  def new
    event_type = params[:event_type]

    @event = case event_type
            when 'A'
              Event.new(event_type: 'event_a')
            when 'B'
              Event.new(event_type: 'event_b')
            else
              Event.new
            end
  end

  def edit
  end

  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to event_url(@event), notice: "Event was successfully created." }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { redirect_to '/events/new?event_type=A', alert:  @event.errors.full_messages.first }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to event_url(@event), notice: "Event was successfully updated." }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { redirect_to root_url, alert:  @event.errors.full_messages.first }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event.destroy!

    respond_to do |format|
      format.html { redirect_to events_url, notice: "Event was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find_by(id: params[:id])
      unless @event
        redirect_to root_path, alert: "Invalid event ID"
      end
    end

    # Strong parameters to only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:name, :event_type, :event_code)
    end
end
