require './nameable'
require './base_decorator'
require './capitalize_decorator'
require_relative './trimmer_decorator'

class Person < Nameable
  # getter/setter methods
  attr_reader :id
  attr_accessor :name, :age

  # constructor method
  def initialize(age, name = 'Unknown', parent_permission: true)
    super()

    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end
  # instance methods

  def correct_name
    name
  end

  def can_use_services?
    p of_age? || @parent_permission
  end
  # private method

  private

  def of_age?
    age >= 18
  end
end

# teacher = Person.new('Mathew', 18)
# teacher.can_use_services?
person = Person.new(22, 'maximilianus')
person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name
