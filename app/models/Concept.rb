class Concept < ActiveRecord::Base
    has_many :lessons
    has_many :students, through: :lessons

    def self.list_unique_data_structures 
        Concept.pluck(:data_structure).uniq
    end

    

    # def self.list_tasks_by_data_structure(data_structure)
    #     list = Concept.list_unique_data_structures
    #     if data_structure == list
    #         return list[0][1]
    #     end
    # end
end