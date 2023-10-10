require "./person.rb"

class Student < Person
  attr_accessor :classroom
  # constructor method
  def initialize(classroom, age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission)
    @classroom = classroom
    end
  # instance method
  def play_hooky
    '¯\\(ツ)/¯'
  end
end
  
