class Student < ActiveRecord::Base
  belongs_to :school
  belongs_to :teacher

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  validates :age, presence: true
end
