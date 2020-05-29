class CreateStudentsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :name
      t.timestamps
    end
 
    create_table :lessons do |t|
      t.belongs_to :student
      t.datetime :published_at
      t.timestamps
    end
  end
end
