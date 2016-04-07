class Api::TeachersController < ApplicationController
  skip_before_action :authenticate_user
  protect_from_forgery with: :null_session
  def index
    render json: Teacher.all
  end

  def show
    render json: Teacher.find(params.fetch(:id))
  rescue ActiveRecord::RecordNotFound
    render json: { message: "Not found", status: 404 }, status: 404
  end

  def create
    teacher = Teacher.create!(first_name: params[:first_name], last_name: params[:last_name], address: params[:address], age: params[:age])
    render json: teacher
  rescue ActiveRecord::RecordInvalid
    render json: { message: "Bad request, need all paramaters", status: 400 }, status: 400
  end

  def update
    teacher = Teacher.find(params[:id])
    teacher.update(last_name: params[:first_name], last_name: params[:last_name], address: params[:address], age: params[:age])
    teacher.save!
    render json: teacher
  rescue ActiveRecord::RecordInvalid
    render json: { message: "Bad request, need all paramaters", status: 400 }, status: 400
  rescue ActiveRecord::RecordNotFound
    render json: { message: "Not found", status: 404 }, status: 404
  end

  def destroy
    teacher = Teacher.find(params[:id])
    teacher.delete
    render json: teacher
  rescue ActiveRecord::RecordNotFound
    render json: { message: "Not found", status: 404 }, status: 404
  end
end
