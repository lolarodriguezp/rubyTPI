class CreateEvaluations < ActiveRecord::Migration[5.1]
  def change
    create_table :evaluations do |t|
      t.string :title
      t.date :date
      t.integer :minNote

      t.references :course, foreign_key: true
      t.timestamps
    end
  end
end
