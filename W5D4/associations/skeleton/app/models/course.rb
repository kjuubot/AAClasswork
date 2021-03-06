class Course < ApplicationRecord
  has_many :enrollments, 
    primary_key: :id,   
    foreign_key: :course_id,
    class_name: :Enrollment

  has_many :enrolled_students,
    through: :enrollments,
    source: :user
  
  belongs_to :prereq, # Ruby 101
    primary_key: :id,
    foreign_key: :prereq_id,
    class_name: :Course

  has_many :upper_divs, # Ruby 102
    primary_key: :id,
    foreign_key: :prereq_id,
    class_name: :Course

  belongs_to :instructor,
  primary_key: :id,   
  foreign_key: :instructor_id,
  class_name: :User

end
