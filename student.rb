require './person'

class Student < Person
  attr_reader :classroom

  # constructor method
  def initialize(age, classroom, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission)
    @classroom = classroom
  end
  # instance methods
  def classroom=(classroom)
    @classroom = classroom
    # has-many/belongs-to relationship between Classroom and Student
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    p '¯\\(ツ)/¯'
  end
end

stud = Student.new(18, 'yellow')
stud.play_hooky
