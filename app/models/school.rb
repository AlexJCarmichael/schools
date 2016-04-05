class School < ActiveRecord::Base
  has_many :students, dependent: :destroy
  has_many :teachers, dependent: :destroy

  def teacher_count
    teachers.count
  end

  def student_count
    students.count
  end
end
