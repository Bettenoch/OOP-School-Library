require './person'

class Student < Person
  attr_accessor :classroom

  # constructor method
  def initialize(classroom)
    super('blue', 18)
    @classroom = classroom
  end
  # instance method

  def play_hooky
    p '¯\\(ツ)/¯'
  end
end

stud = Student.new('ham')
stud.play_hooky
