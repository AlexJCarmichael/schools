class School < ActiveRecord::Base
  has_many :students, dependent: :destroy
  has_many :teachers, dependent: :destroy
  validates :name, presence: true
  validates :motto, presence: true
  validates :address, presence: true
  def teacher_count
    teachers.count
  end

  def student_count
    students.count
  end

end
