class CreateConceptsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :concepts do |t|
      t.references :student
      t.text :task
      t.text :full_description
      t.timestamps
    end

    
  end
end
