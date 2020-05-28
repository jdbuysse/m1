class Concept < ActiveRecord::Base
    has_many :lessons
    has_many :students, through: :lessons

    def self.list_unique_data_structures 
        Concept.pluck(:data_structure).uniq
    end

    def self.list_tasks_by_data_structure(data_structure)
        Concept.where(data_structure: data_structure).find_each do |concept| 
            puts concept.task
        end
        binding.pry
    end
end