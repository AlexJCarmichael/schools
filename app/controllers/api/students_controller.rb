class Api::StudentsController < ApplicationController
  skip_before_action :authenticate_user
  protect_from_forgery with: :null_session
  def index
    render json: Student.all
  end

  def show
    render json: Student.find(params.fetch(:id))
  rescue ActiveRecord::RecordNotFound
    render json: { message: "Not found", status: 404 }, status: 404
  end

  def create
    student = Student.create!(name: params[:name], mascot: params[:mascot], address: params[:address])
    render json: student
  rescue ActiveRecord::RecordInvalid
    render json: { message: "Bad request", status: 400 }, status: 400
  end

  def update
    student = Student.find(params[:id])
    student.update(name: params[:name], mascot: params[:mascot], address: params[:address])
    student.save!
    render json: student
  rescue ActiveRecord::RecordInvalid
    render json: { message: "Bad request", status: 400 }, status: 400
  rescue ActiveRecord::RecordNotFound
    render json: { message: "Not found", status: 404 }, status: 404
  end

  def destroy
    student = Student.find(params[:id])
    student.delete
    render json: student
  rescue ActiveRecord::RecordNotFound
    render json: { message: "Not found", status: 404 }, status: 404
  end
end
