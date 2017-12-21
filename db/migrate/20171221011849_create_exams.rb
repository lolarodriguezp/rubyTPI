class CreateExams < ActiveRecord::Migration[5.1]
  def change
    create_table :exams do |t|
      t.float :note, null:false, default:"Ausente"
      t.references :student, foreign_key: true
	  t.references :evaluation, foreign_key: true
      t.timestamps
    end
  end
end
