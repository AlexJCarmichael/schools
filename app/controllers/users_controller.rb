class UsersController < ApplicationController
skip_before_action :authenticate_user
def new
  @user = User.new
end

def create
  binding.pry
  @user = User.new(user_params)
  if @user.save
    #session[:user_id] = user.id
    redirect_to root_path, notice: 'User created!'
  else
    flash.now[:alert] = 'Errors Occured'
    render :new
  end
end

private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :user_name, :password, :password_confirmation)
  end
end
