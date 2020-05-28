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

    def other_student
        puts Lesson.students_from_my_concept(concepts.ids)
        binding.pry
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
            other_student
        when 3
            puts "3"
        end
    end

    

    def explore_concepts
        ds_choice = select_data_structure
        task_choice = select_tasks_from_data_structure(ds_choice)
        puts "You selected #{task_choice}. \n"
        concept = Concept.find_concept_by_task(task_choice)
        display_task(concept)
        puts "What do ya think? Enter how comfortable you'd be"
        puts "with this task on a scale from 1-5."
        puts "1 == no idea, 5 == no problemo"
        input = gets.chomp
        puts "you're at a #{input}? great! we'll add that info"
        puts "press enter to go back to main menu"
        add_lesson(concept, input)
        gets
    end

    def display_task(concept)
        puts concept.task
        puts concept.full_description
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
        return tasks[(task_input.to_i)-1]
    end

    

end