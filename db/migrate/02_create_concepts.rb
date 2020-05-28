class CreateConcepts < ActiveRecord::Migration[5.2]
    def change
      create_table :concepts do |t|
        t.string :data_structure
        t.string :task
        t.text :full_description
      end
    end
  end