class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :last_name
      t.string :first_name
      t.integer :document
      t.string :docket
      t.string :email

      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
