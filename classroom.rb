class Classroom
    # getter/setter methods
    attr_reader :students
    attr_accessor :label

    
    def initialize(label)
      @label = label
      @students = []
    end
    # has-many/belongs-to relationship between Classroom and Student
    def add_student(student)
      @students << student
      student.classroom = self
    end
  end