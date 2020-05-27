class CreateLessons < ActiveRecord::Migration[5.2]
    def change
      create_table :lessons do |t|
        t.integer :student_id
        t.integer :concept_id
        t.string :task
        t.date :last_studied
        t.string :difficulty
        t.integer :comfort_level
        t.text :full_description
      end
    end
  end