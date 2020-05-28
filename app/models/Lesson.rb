class Lesson < ActiveRecord::Base
    belongs_to :student
    belongs_to :concept


    def self.students_from_my_concept(my_concept)
        # classmmate = Concept.where(concept_id: my_concept)
        if Concept.exists?(:concept_id=> my_concept)
            classmmate = Concept.find(:student_id, :concept_id=>my_concept)
            puts "There are many"
            Student.find_by(:name, :student_id => classmmate)

        else
            puts "Oh well"
            puts my_concept
            puts "There are none"
            
        end

    end


end