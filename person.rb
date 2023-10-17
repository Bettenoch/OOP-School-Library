require './nameable'
require './base_decorator'
require './capitalize_decorator'
require './trimmer_decorator'
require './rental'
require './book'


class Person < Nameable
  # getter/setter methods
  attr_reader :id
  attr_accessor :name, :age, :rentals

  # constructor method
  def initialize(age, name = 'Unknown', parent_permission: true)
    super()

    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end
  # instance methods
  # belongs-to side of Rental and Person (a rental belongs to a person).

  def add_rental(rental)
    @rentals.append(rental)
  end

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

# book = Book.new('Atomic Habits','James Clear')
# rental_person = Rental.new(person,book,'3/3/2023')
# puts rental_person
