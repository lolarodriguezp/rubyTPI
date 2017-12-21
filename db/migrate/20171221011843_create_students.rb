class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :lastName
      t.string :firstName
      t.integer :dni
      t.string :legajo
      t.string :mail

      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
