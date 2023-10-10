class Person
  # getter/setter methods
  attr_reader :id
  attr_accessor :name
  attr_accessor :age

  # constructor method
  def initialize(name = "Unknown", age, parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end
  # instance method
  def can_use_services?
    p of_age? || @parent_permission
  end
  # private method
  private
  def of_age?
    age >= 18
  end
end

teacher = Person.new('Mathew', 18)
teacher.can_use_services?