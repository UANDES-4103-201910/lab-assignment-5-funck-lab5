class TicketTypesController < ApplicationController

  def show
    render json: @ticket_type
  end

  def index
    render json: TicketType.all
  end

  def create
    @ticket_type = TicketType.new(params[:ticket_type])
    if @ticket_type.save
      render :json => @ticket_type.to_json
    else
      render :json => { :errors => @ticket_type.errors.full_messages }
    end
  end

  def update
    if @ticket_type.update(params[:ticket_type])
      render :json => @ticket_type.to_json
    else
      render :json => { :errors => @ticket_type.errors.full_messages }
    end
  end

  def destroy
    @ticket_type.destroy
    redirect_to ticket_type
  end

end
