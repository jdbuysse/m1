class Student < ActiveRecord::Base
    has_many :lessons
    has_many :concepts, through: :lessons

    def add_lesson(concept, comfort)
        # Need to somehow make sure there aren't redundant lessons?
        Lesson.create(
            student_id: self.id,
            concept_id: concept.id,
            last_studied: Time.now.strftime("%d/%m/%Y"),
            comfort_level: comfort,
        )
    end

    def update_lesson(lesson, comfort)
        lesson.update(
            last_studied: Time.now.strftime("%d/%m/%Y"), 
            comfort_level: comfort
        )
        lesson.save
    end

    def self.list_names
        puts "Here's who else is working:"
        Student.all.each {|s| puts s.name}
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
            'debug/test' => 4,
            'see your lessons' => 5
        }
        menu_response = prompt.select("\nWhat would you like to do?", choices)
        case menu_response
        when 1
            explore_concepts
        when 2
            binding.pry
            Student.list_names
            puts "press any key to continue"
            gets
            main_menu
        when 3
            puts "Goodbye!"
        when 4
            binding.pry
        when 5
            list_student_concepts
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
        lesson = Lesson.find_lesson_by_student(self.id)
        if lesson == nil
            add_lesson(concept, input)
        else
            update_lesson(lesson, input)
        end
        gets
        main_menu
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

    def list_student_concepts
        lessons = Lesson.find_all_lessons_by_student(self.id)
        lessons.each do |lesson| 
            Concept.print_by_id(lesson.concept_id) 
            puts "you rated your comfort at #{lesson.comfort_level.to_s} when you last studied this on #{lesson.last_studied}"
        end
        
    end

end