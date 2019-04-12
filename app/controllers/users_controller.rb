class UsersController < ApplicationController

  def user_with_most_tickets
    tickets_per_user = []
    User.all.each do |user|
      tickets_per_user.push(user.tickets.length)
    end
    id = tickets_per_user.find_index(tickets_per_user.max)
    @user = User.find_by("id = ?",id)
    render :json => @user
  end

  def show
    render json: @user
  end

  def index
    render json: User.all
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      render :json => @user.to_json
    else
      render :json => { :errors => @user.errors.full_messages }
    end
  end

  def update
    if @user.update(params[:user])
      render :json => @user.to_json
    else
      render :json => { :errors => @user.errors.full_messages }
    end
  end

  def destroy
    @user.destroy
    redirect_to user
  end

end
