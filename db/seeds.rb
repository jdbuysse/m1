# Add seed data here. Seed your database with `rake db:seed`
binding.pry
s1 = Student.create(name: "Tom", track: "SWE")
s2 = Student.create(name: "Evelina", track: "SWE")


c1 = Concept.create(
    data_structure: "Binary Tree",
    task: "Same binary tree?",
    full_description: "Given two binary trees, write a function to check if they are the same or not. Two binary trees are considered the same if they are structurally identical and the nodes have the same value."
)

c2 = Concept.create(
    data_structure: "Binary Tree",
    task: "Reverse a binary tree's leaves",
    full_description: ""
)

l1 = Lesson.create(
    student_id: s1.id,
    concept_id: c1.id,
    last_studied: nil,
    comfort_level: '1',
    )


