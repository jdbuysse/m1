class Lesson < ActiveRecord::Base
    belongs_to :student
    belongs_to :concept

    def self.find_lesson_by_student(id)
        Lesson.all.find_by(student_id: id)
    end

end