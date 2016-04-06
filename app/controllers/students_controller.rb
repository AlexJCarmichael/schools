class StudentsController < ApplicationController
  def index
    @students = Student.order(:id).page params[:page]
  end

  def show
    @student = get_student
  end

  def edit
    @student = get_student
  end

  def update
    @student = get_student

    if @student.update(student_params)
      redirect_to @student
    else
      render :edit
    end
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)

    if @student.save
      redirect_to @student
    else
      render :new
    end
  end

  def destroy
    @student = get_student

    if @student.destroy
      redirect_to students_path
    else
      redirect_to :back
    end
  end

  private
  def get_student
    Student.find(params.fetch(:id))
  end

  def student_params
    params.require(:student).permit(:first_name, :last_name, :address, :age)
  end
end
