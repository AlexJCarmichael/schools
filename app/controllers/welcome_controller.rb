class WelcomeController < ApplicationController
  skip_before_action :authenticate_user
  def index
    @schools = School.order(:name).page params[:page]
  end
end
