class SessionsController < ApplicationController
  skip_before_action :authenticate_user

  def sign_in
  end

  def create
    # Authenticate the User
    # Assign the success to the session
    # Redirect
    user = User.find_by(user_name: params[:user_name])


    if user.present?
      if user.authenticate(params[:password])
        session[:user_id] = user.id
        flash.now[:notice] = "Successfully signed in!"
        redirect_to root_path
      else
        flash.now[:alert] = "Username and password did not match any records"
        render :sign_in
      end
    else
      flash.now[:alert] = "Username and password did not match any records"
      render :sign_in
    end
  end

  def destroy
    session[:user_id] = nil
    flash.now[:notice] = "Signed out!"
    redirect_to root_path
  end

  def sign_out
  end
end
