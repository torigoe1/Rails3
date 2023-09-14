class RoomController < ApplicationController
 
  def index
    @user = current_user
  end

  def new
    @user = current_user
  end

  def create
    @room = Room.new(room_params)
    @room.save
  end

  def show
    @room = Room.find_by(id:params[:id])
  end

  def edit
  end

  def update
  end

  def own
  end


end
