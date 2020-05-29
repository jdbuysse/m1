class Lesson < ActiveRecord::Base
    belongs_to :student, touch: :lessons_updated_at, counter_cache: :count_of_students
    # , inverse_of: :students
    has_many :concepts
end