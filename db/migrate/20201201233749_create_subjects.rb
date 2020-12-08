class CreateSubjects < ActiveRecord::Migration[6.0]
  def change
    create_table :subjects do |t|
      t.string :subject_title, null: false
      t.string :weekday, null: false
      t.integer :period, null: false
      t.references :teacher, foreign_key: true
      t.timestamps
    end
  end
end
