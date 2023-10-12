class Rental
    attr_accessor :date, :book, :person
  
    def initialize(date, book, person)
      @date = date
      @book = book
      @person = person
      #belongs-to side of Rental and Person
      person.rentals << self
      #belongs-to side of Rental and Book
      book.rentals << self
    end
  end