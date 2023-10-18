require 'rspec'
require_relative '../classroom'
require_relative '../book'
require_relative '../person'

describe Rental do
  let(:book_one) { Book.new('World According to Gaap', 'John Graph') }
  let(:book_two) { Book.new('Caucasian Chalk Circle', 'Susan') }
  let(:person_one) { Person.new(26, 'Chris Martin') }
  let(:person_two) { Person.new(29, 'Westbrook') }

  context 'Check added rentals' do
    before do
      @rental_one = Rental.new('2023/05/12', book_one, person_one)
      @rental_two = Rental.new('2022/05/23', book_one, person_one)
      @rental_three = Rental.new('2023/07/20', book_two, person_two)
    end

    it 'Have rentals init' do
      expect(person_one.rentals.length).to eq 2
      expect(book_one.rentals.length).to eq 2
      expect(person_one.rentals).to include @rental_two, @rental_one
      expect(person_two.rentals).to include @rental_three  
    end
  end
end