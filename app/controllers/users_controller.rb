class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(username: user_params[:username])
    if user_params[:password] == user_params[:password_confirmation] && !user
      @user = User.new(user_params)
      if @user.save
        flash[:notice] = 'User has been created'
        redirect_to '/'
      else
        flash[:alert] = 'User not created'
        redirect_to :back
      end
    elsif user
      flash[:alert] = 'Username is already taken'
      redirect_to :back
    else
      flash[:alert] = 'Please try again'
      redirect_to :back
    end
  end

  def index
    helpers.current_user
  end

private
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
