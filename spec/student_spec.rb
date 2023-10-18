require 'rspec'
require_relative '../classroom'
require_relative '../student'

describe Student do
    context 'Testing Student and methods' do
      it 'Should create an instance of Student' do
        stud = Student.new(33, 'King', true)
        expect(stud).to be_a Student
      end
  
      it 'Set the classroom' do
        stud = Student.new(33, 'King', true)
        room = Classroom.new('Economics')
        stud.classroom = (room)
        expect(room).to be_a Classroom
        expect(stud.classroom.label).to eq 'Economics'
      end
  
      it 'Should return characters ' do
        stud = Student.new(33, 'King', true)
        expect(stud.play_hooky).to eq '¯\(ツ)/¯'
      end
    end
  end