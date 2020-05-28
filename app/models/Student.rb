class Student < ActiveRecord::Base
    has_many :lessons
    has_many :concepts, through: :lessons

    def self.find_student(user_input)
        @found_user = all.find_by(name: user_input)

        if @found_user
            puts "Welcome back, #{@found_user.name}!"
            @found_user.main_menu
        else 
            create_user(user_input)
        end
    end

    def self.create_user(user_name)
        @new_user = create(name: user_name, track: 'SWE')
        puts "Hello, #{@new_user.name}! Glad you could join us."
        @new_user.main_menu
    end

    def main_menu

        prompt = TTY::Prompt.new

        choices = {
            'Explore concepts' => 1,
            'See who else is here' => 2,
            'Exit the program' => 3,
        }

        menu_response = prompt.select("\nWhat would you like to do?", choices)

        case menu_response
        when 1
            puts "1"
            pick_task
        when 2
            puts "2"
        when 3
            puts "3"
        end
    end

    def pick_task
        puts Concept.list_unique_data_structures
        input = gets.chomp
        Concept.list_tasks_by_data_structure(input)
    end

end