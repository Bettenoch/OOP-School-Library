require 'rspec'
require_relative '../person'

describe Person do
  person = Person.new(24, 'John', parent_permission: true)
  context 'should create instance of Person Class and test methods' do
      it 'Should match given name' do
        expect(person.name).to eq('John')   
      end
      it 'has an ID' do
        expect(person.id).to be_a(Integer)
      end
      it 'has an age' do
        expect(person.age).to eq(24)
      end
      it 'can use services with parent permission' do
        expect(person.can_use_services?).to be(true)
      end
      it 'Test add rental method' do
        person = Person.new(24, 'John', parent_permission: true)
        book = Book.new('The River Between', 'Ngungi Thiongo')
        rental = Rental.new('2023/18/10', book, person)
        person.add_rental(rental)
        expect(person.rentals).to include(rental)
      end
    end
end