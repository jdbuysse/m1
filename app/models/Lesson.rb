class Lesson < ActiveRecord::Base
    belongs_to :student
    belongs_to :concept

    def self.find_lesson_by_student(id)
        Lesson.all.find_by(student_id: id)
    end

    def self.find_all_lessons_by_student(id)
        Lesson.where(student_id: id).find_each.map { |l| l} 
    end

end