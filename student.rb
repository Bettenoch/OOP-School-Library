require './person'

class Student < Person
  attr_reader :classroom

  # constructor method
  def initialize(age, name, _parent_permission, classroom = ' ')
    super(age, name, parent_permission: true)
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

  def to_h
    {
      _class: self.class.name,
      id: @id,
      name: @name,
      age: @age,
      parent_permission: @parent_permission,
      classroom: @classroom
    }
  end
end

# stud = Student.new(18, 'yellow')
# stud.play_hooky
