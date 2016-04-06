class Teacher < ActiveRecord::Base
  belongs_to :school
  has_many :students, dependent: :destroy

  def students_list
    Student.where("teacher_id = #{self.id}")
  end
end
