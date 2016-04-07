
class Api::SchoolsController < ApplicationController
  skip_before_action :authenticate_user
  protect_from_forgery with: :null_session
  def index
    render json: School.all
  end

  def show
    render json: School.find(params.fetch(:id))
  rescue ActiveRecord::RecordNotFound
    render json: { message: "Not found", status: 404 }, status: 404
  end

  def create
    school = School.create!(name: params[:name], mascot: params[:mascot], address: params[:address])
    render json: school
  rescue ActiveRecord::RecordInvalid
    render json: { message: "Bad request", status: 400 }, status: 400
  end

  def update
    school = School.find(params[:id])
    school.update(name: params[:name], mascot: params[:mascot], address: params[:address])
    school.save!
    render json: school
  rescue ActiveRecord::RecordInvalid
    render json: { message: "Bad request", status: 400 }, status: 400
  rescue ActiveRecord::RecordNotFound
    render json: { message: "Not found", status: 404 }, status: 404
  end

  def destroy
    school = School.find(params[:id])
    school.delete
    render json: school
  rescue ActiveRecord::RecordNotFound
    render json: { message: "Not found", status: 404 }, status: 404
  end
end
