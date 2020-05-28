class Student < ActiveRecord::Base
    has_many :lessons
    has_many :concepts, through: :lessons

    def add_lesson(concept, comfort)
        Lesson.create(
            student_id: self.id,
            concept_id: concept.id,
            last_studied: Time.now.strftime("%d/%m/%Y"),
            comfort_level: comfort,
        )
    end

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
            explore_concepts
        when 2
            puts "2"
        when 3
            puts "3"
        end
    end

    def explore_concepts
        ds_choice = select_data_structure
        task_choice = select_tasks_from_data_structure(ds_choice)

    end

    def select_data_structure
        puts "Select a data structure for which you'd like to see some tasks"
        ds = Concept.list_unique_data_structures
        ds.each_with_index { |ds, index| puts "#{index +1}. #{ds} \n" } #can make this DRYer
        input = gets.chomp
        puts "You selected #{ds[(input.to_i)-1]}"
        return ds[(input.to_i)-1]
    end

    def select_tasks_from_data_structure(ds)
        puts "Here are the tasks for #{ds}:"
        tasks = Concept.list_tasks_by_data_structure(ds)
        tasks.each_with_index { |task, index| puts "#{index +1}. #{task} \n" }
        task_input = gets.chomp
        puts "You selected #{tasks[(task_input.to_i)-1]}"
        return tasks[(task_input.to_i)-1]
    end

end