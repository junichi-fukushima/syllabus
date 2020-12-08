class CreateLectures < ActiveRecord::Migration[6.0]
  def change
    create_table :lectures do |t|
      t.string :lecture_title, null: false
      t.date :lecture_date, null: false
      t.references :subject, foreign_key: true
      t.timestamps
    end
  end
end