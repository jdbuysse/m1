

20.times do 
    nameing = Faker::Name.name
    Student.create( name: nameing)
    Lesson.create(student_id: Student.pluck(:id), published_at: Faker::Time.backward(days: 5, period: :morning, format: :short))
    Concept.create(task: Faker::ElectricalComponents.electromechanical,student_id: Student.pluck(:id))
end
