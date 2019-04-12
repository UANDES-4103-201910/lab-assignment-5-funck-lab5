class EventVenuesController < ApplicationController

  def show
    render json: @event_venue
  end

  def index
    render json: EventVenue.all
  end

  def create
    @event_venue = EventVenue.new(params[:event_venue])
    if @event_venue.save
      render :json => @event_venue.to_json
    else
      render :json => { :errors => @event_venue.errors.full_messages }
    end
  end

  def update
    if @event_venue.update(params[:event_venue])
      render :json => @event_venue.to_json
    else
      render :json => { :errors => @event_venue.errors.full_messages }
    end
  end

  def destroy
    @event_venue.destroy
    redirect_to event_venue
  end

end
