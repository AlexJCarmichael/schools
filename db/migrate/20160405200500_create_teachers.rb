class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :address, null: false
      t.integer :age, null: false
      t.belongs_to :school, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
