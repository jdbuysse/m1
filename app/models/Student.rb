class Student < ActiveRecord::Base
    has_many :lessons
    has_many :concepts, through: :lessons


end