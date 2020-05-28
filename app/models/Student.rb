class Student < ActiveRecord::Base
    has_many :lessons
    has_many :concepts, through: :lessons

    def self.find_student(user_input)
        @found_user = all.find_by(name: user_input)

        if @found_user
            puts "Welcome back, #{@found_user.name}!"
        else 
            puts "We'll create a student account for you"
        end
    end
    
end