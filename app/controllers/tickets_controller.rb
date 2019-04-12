class TicketsController < ApplicationController

  def show
    render json: @ticket
  end

  def index
    render json: Ticket.all
  end

  def create
    @ticket = Ticket.new(params[:ticket])
    if @ticket.save
      render :json => @ticket.to_json
    else
      render :json => { :errors => @ticket.errors.full_messages }
    end
  end

  def update
    if @ticket.update(params[:ticket])
      render :json => @ticket.to_json
    else
      render :json => { :errors => @ticket.errors.full_messages }
    end
  end

  def destroy
    @ticket.destroy
    redirect_to ticket
  end

end
