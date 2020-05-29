class Student < ActiveRecord::Base
    has_many :lessons, inverse_of: :student
    
    
end