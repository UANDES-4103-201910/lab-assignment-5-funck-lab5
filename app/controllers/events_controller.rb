class EventsController < ApplicationController

  def upcoming_events
    end_date = Date.today.next_month.next_month.next_month
    events = Event.where(:start_date => Date.today.at_beginning_of_month...end_date.end_of_month)
    render json: events
  end

  def show
    render json: @event
  end

  def index
    render json: Event.all
  end

  def create
    @event = Event.new(params[:event])
    if @event.save
      render :json => @event.to_json
    else
      render :json => { :errors => @event.errors.full_messages }
    end
  end

  def update
    if @event.update(params[:event])
      render :json => @event.to_json
    else
      render :json => { :errors => @event.errors.full_messages }
    end
  end

  def destroy
    @event.destroy
    redirect_to event
  end

end
