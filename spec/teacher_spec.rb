require 'rspec'
require_relative '../teacher.rb'

describe Teacher do
    context 'Test the teacher class and methods' do
        it 'Should create an instance of teacher class' do
            teacher = Teacher.new('Bett', 23, 'Biology')
            expect(teacher).to be_a Teacher
            expect(teacher.age).to eq(23)
        end

        it 'Testing can use services' do
            teacher = Teacher.new('Bett', 23, 'Biology')
            use_services = teacher.can_use_services?
            expect(use_services).to eq true
          end
    end
end