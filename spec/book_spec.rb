require 'rspec'
require_relative '../book'
require_relative '../rental'
require_relative '../student'

describe Book do
  context 'Create an instance and add rentals to the book' do
    it 'should create an instance of a book' do
      book = Book.new('Shreds of Happyness', 'Williams')
      expect(book).to be_a Book
    end

    it 'Add a book to rentals' do
      person = Student.new(21, 'Bett', 'y')
      book = Book.new('Shreds of Happyness', 'Williams')

      book_rented = book.add_rental(person, '2023-21-09')
      expect(book_rented).to be_a Rental
    end
  end
end
