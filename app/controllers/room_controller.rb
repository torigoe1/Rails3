class RoomController < ApplicationController
 
  def index
    @user = current_user
  end

  def new
    @user = current_user
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    @room.user_id = current_user.id
    if @room.image_name == nil
      @room.image_name = "default-image.png"
    end

    @room.save
    redirect_to "/"
  end

  def show
    @user = current_user
    @room = Room.find_by(id:params[:id])
  end

  def edit
    @user = current_user
    @room = Room.find_by(id:params[:id])

  end

  def update
    @user = current_user
    @room = Room.find_by(id:params[:id])
   if @room.update(room_params)
    redirect_to "/room/#{@room.id}"
   end
  end

  def delete
  end

  def own
    @user = current_user
    @room = Room.where(user_id: current_user.id)
  end

  def search
    @user = current_user
    @room = Room.where("address like ?", "%#{params[:area]}%")
    
    if params[:keyword].present?
      @room = Room.where(['introduce LIKE(?) OR name LIKE(?)', "%#{params[:keyword]}%","%#{params[:keyword]}%"])
    end 
  end

  private
  def room_params
    params.require(:room).permit(:name, :introduce, :price, :address, :image_name)
  end


end
