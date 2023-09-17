class ReservationController < ApplicationController

def index
    @user = current_user
    @reservation = Reservation.where(user_id: current_user.id)
end

def new
end

def create
    @user = current_user
    @reservation = Reservation.new(reservation_params)
    @reservation.save
    redirect_to "/"
end

def confirm
    @user = current_user
    @reservation = Reservation.new(reservation_params)
end


private
def reservation_params
  params.require(:reservation).permit(:room_id, :user_id, :start_date, :end_date, :people)
end


end
