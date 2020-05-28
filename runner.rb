require_relative 'config/environment'
require 'pry'


def welcome
        
        puts "Welcome to the app!"
        puts "Enter a new or existing student name to continue"
        puts "To exit please type 'Quit' or 'Exit'"
        student_name_prompt = gets.chomp
        if student_name_prompt.downcase == 'exit' || student_name_prompt.downcase == 'quit'

            puts "Goodbye"
        else
            
            Student.find_student(student_name_prompt)
            
        end
   
          # ...
        
      
    # binding.pry
    
end



welcome