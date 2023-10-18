require 'rspec'
require_relative '../classroom'
require_relative '../student'

describe Classroom do
    context 'Testing the classroom class and methods' do
        it 'should be empty' do
          room = Classroom.new('Cryptocurrency')
          expect(room.students).to be_empty
        end

        it 'Should create an instance of a classroom' do
          room = Classroom.new('Cryptocurrency')
          expect(room).to be_an_instance_of(Classroom)
        end

        it 'should have same label' do
          room = Classroom.new('Cryptocurrency')
          expect(room.label).to eq('Cryptocurrency')
        end

        it ' Test has-many/belongs-to relationship between Classroom and Student' do
          classroom = Classroom.new('Hackers')
          stud = Student.new(1, 'kipsang', true) # Create a sample student
      
          classroom.add_student(stud)
          expect(stud.classroom).to eq(classroom)
        end
    end
end
