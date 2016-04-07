class Teacher < ActiveRecord::Base
  belongs_to :school
  has_many :students, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  validates :age, presence: true

end
