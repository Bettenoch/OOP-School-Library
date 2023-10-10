require "./person.rb"

class Student < Person
  attr_accessor :classroom
  # constructor method
  def initialize(classroom, name = 'Unknown')
    super('blue', 18)
    @classroom = classroom
  end
  # instance method
  def play_hooky
    p '¯\\(ツ)/¯'
  end
end

stud = Student.new('ham', 'kan')
stud.play_hooky
