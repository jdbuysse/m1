# Add seed data here. Seed your database with `rake db:seed`

s1 = Student.create(name: "Tom", track: "SWE")
s2 = Student.create(name: "Evelina", track: "SWE")


c1 = Concept.create(data_structure: "Binary Tree")


l1 = Lesson.create(
    student_id: s1.id,
    concept_id: c1.id,
    task: 'test task',
    difficulty: 'hard',
    comfort_level: '1',
    full_description: "yadda yadda"
    )

Lesson.create(
    
)

