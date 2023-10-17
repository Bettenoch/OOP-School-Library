require './person'

class Teacher < Person
  # getter/setter method
  attr_reader :specialization

  # constructor method
  def initialize(name, age, specialization, parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @specialization = specialization
  end
  # override method

  def can_use_services?
    true
  end

  def to_h
    {
      _class: self.class.name,
      id: @id,
      name: @name,
      age: @age,
      specialization: @specialization
    }
  end
end

# tutor = Teacher.new('Chemistry')
# tutor.can_use_services?
