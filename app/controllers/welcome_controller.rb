class WelcomeController < ApplicationController
  def index
    @schools = School.order(:name).page params[:page]
  end
end
