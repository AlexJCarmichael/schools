class Teacher < ActiveRecord::Base
  belongs_to :school
  has_many :students
end
