# Add seed data here. Seed your database with `rake db:seed`

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

Concept.create(
    data_structure: "Trees",
    task: "Find Maximum depth of an N-ary Tree",
    full_description: "The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node."
)

Concept.create(
    data_structure: "Trees",
    task: "Delete leaves with a given value from a binary tree",
    full_description: "Note that once you delete a leaf node with value target, if it's parent node becomes a leaf node and has the value target, it should also be deleted (you need to continue doing that until you can't)."
)


Concept.create(
    data_structure: "Hash Tables",
    task: "Longest substring",
    full_description: "Given a string, find the length of the longest substring without repeating characters."
)


Concept.create(
    data_structure: "Hash Tables",
    task: "Valid anagram",
    full_description: "Given two strings s and t , write a function to determine if t is an anagram of s."
)

Concept.create(
    data_structure: "Hash Tables",
    task: "Find the intersection of two arrays",
    full_description: "Given two arrays, write a function to compute their intersection."
)

Concept.create(
    data_structure: "Arrays",
    task: "'Chunk' an array",
    full_description: "Given an array, 'chunk' it into an array of arrays of size x"
)
Concept.create(
    data_structure: "Arrays",
    task: "Find the median of two sorted arrays",
    full_description: ""
)

Concept.create(
    data_structure: "Arrays",
    task: "Remove duplicates from a sorted array",
    full_description: "Given a sorted array nums, remove the duplicates in-place such that each element appear only once and return the new length."
)

Concept.create(
    data_structure: "Arrays",
    task: "Rotate an array",
    full_description: "Given an array, rotate the array to the right by k steps, where k is non-negative."
)

Concept.create(
    data_structure: "Arrays",
    task: "Find Pivot Index",
    full_description: "Given an array of integers nums, write a method that returns the pivot index of this array.
    We define the pivot index as the index where the sum of all the numbers to the left of the index is equal to the sum of all the numbers to the right of the index.
    "
)
Concept.create(
    data_structure: "Linked Lists",
    task: "Merge two Sorted Lists",
    full_description: ""
)

Concept.create(
    data_structure: "Linked Lists",
    task: "Reverse a linked list",
    full_description: ""
)
Concept.create(
    data_structure: "Linked Lists",
    task: "Remove all elements from a linked list with value X",
    full_description: ""
)
Concept.create(
    data_structure: "Linked Lists",
    task: "Find the middle of a linked list",
    full_description: ""
)


l1 = Lesson.create(
    student_id: s1.id,
    concept_id: c1.id,
    last_studied: nil,
    comfort_level: '1',
    )


