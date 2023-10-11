require './person'

class Teacher < Person
  # getter/setter method
  attr_accessor :specialization

  # constructor method
  def initialize(age, specialization, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission)
    @specialization = specialization
  end
  # override method

  def can_use_services?
    true
  end
end

# tutor = Teacher.new('Chemistry')
# tutor.can_use_services?
