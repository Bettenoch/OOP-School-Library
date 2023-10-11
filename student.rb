require './person'

class Student < Person
  attr_accessor :classroom

  # constructor method
  def initialize(age, classroom, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission)
    @classroom = classroom
  end
  # instance method

  def play_hooky
    p '¯\\(ツ)/¯'
  end
end

stud = Student.new(18, 'yellow')
stud.play_hooky
