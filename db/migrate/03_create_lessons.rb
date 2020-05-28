class CreateLessons < ActiveRecord::Migration[5.2]
    def change
      create_table :lessons do |t|
        t.integer :student_id
        t.integer :concept_id
        t.date :last_studied
        t.integer :comfort_level
      end
    end
  end