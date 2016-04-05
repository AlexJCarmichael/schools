class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.int :age
      t.belongs_to :school, index: true, foreign_key: true
      t.belongs_to :teacher, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
