require "./person.rb"

class Teacher < Person
    # getter/setter method
    attr_accessor :specialization
    # constructor method
    def initialize(specialization, name = 'Unknown')
      super('John', 18)
      @specialization = specialization
    end
    # override method
    def can_use_services?
      true
    end
  end

  tutor = Teacher.new('Chemistry', 'Tom')
  tutor.can_use_services?