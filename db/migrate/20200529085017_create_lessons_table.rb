class CreateLessonsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.datetime   :published_at
      t.string :type_lesson
      t.integer :comfort_difficulty 
      t.references :student
    

      
    end

  end
end
