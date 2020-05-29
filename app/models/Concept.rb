class Concept < ActiveRecord::Base
    has_many :lessons
    has_many :students, through: :lessons

    def self.list_unique_data_structures 
        Concept.pluck(:data_structure).uniq
    end

    def self.list_tasks_by_data_structure(data_structure)
        Concept.where(data_structure: data_structure).find_each.map do |concept| 
            concept.task
        end
    end

    def self.find_concept_by_task(task)
        Concept.find_by task: task
    end

    def self.find_by_id(id)
        Concept.find_by id: id
    end


end