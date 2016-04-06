class TeachersController < ApplicationController
  skip_before_action :authenticate_user, only: [:show, :index]
  def index
    @teachers = Teacher.order(:id).page params[:page]
  end

  def show
    @teacher = get_teacher
  end

  def edit
    @teacher = get_teacher
  end

  def update
    @teacher = get_teacher

    if @teacher.update(teacher_params)
      redirect_to @teacher
    else
      render :edit
    end
  end

  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new(teacher_params)

    if @teacher.save
      redirect_to @teacher
    else
      render :new
    end
  end

  def destroy
    @teacher = get_teacher

    if @teacher.destroy
      redirect_to teachers_path
    else
      redirect_to :back
    end
  end

  private
  def get_teacher
    Teacher.find(params.fetch(:id))
  end

  def teacher_params
    params.require(:teacher).permit(:first_name, :last_name, :address, :age, :school_id)
  end
end
