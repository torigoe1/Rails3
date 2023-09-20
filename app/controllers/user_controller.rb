class UserController < ApplicationController
  def account
    @user = User.find(current_user.id)
  end

  def profile
    @user = User.find(current_user.id) 
  end

  def profile_edit
    @user = User.find(current_user.id)
  end

  def new 
    @user = User.new(user_params)
  end

  def create 
    @user = User.new(user_params)
    @user.save!
  end


  def profile_update
   @user = current_user
   @user.update(user_params)
  
    redirect_to "/user/profile"

  end

  private
   def user_params
    params.require(:user).permit(:name,:profile,:avatar)
   end

end
