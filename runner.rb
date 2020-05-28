require_relative 'config/environment'
require 'pry'


def welcome
    puts "Welcome to the app!"
    puts "Enter a new or existing student name to continue"
    student_name_prompt = gets.chomp
    Student.find_student(student_name_prompt)
end


welcome