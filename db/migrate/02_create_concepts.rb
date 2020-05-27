class CreateConcepts < ActiveRecord::Migration[5.2]
    def change
      create_table :concepts do |t|
        t.string :data_structure
      end
    end
  end