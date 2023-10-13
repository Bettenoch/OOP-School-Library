require './student'
require './teacher'
require './book'

class App
  attr_reader :books, :person, :rentals

  def initialize
    @people = []
    @books = []
    @rentals = []
  end
  # welcome message

  def welcome
    puts 'Welcome to Power School Library!!'
  end

  def list_options
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  def list_all_books
    puts 'Oops! Book list is empty!' if @books.empty?
    @books.each { |book| puts "Title: \"#{book.title}\", Author: #{book.author}" }
  end

  def list_all_people
    puts 'Oops! No one has rented a book yet' if @people.empty?
    @people.each{|person| puts "[#{person.class}] Name: #{person.name}, Age: #{person.age}, ID: #{person.id}"}
  end

  # option 1 Create a student
  def create_student
    puts 'Name: '
    name = gets.chomp.capitalize
    puts 'Age: '
    age = gets.chomp.to_i
    puts 'Has parent permission? [Y/N]: '
    permission = gets.downcase == 'y'
    @people << Student.new(age, name, permission)
    puts 'Person created successfully'
  end

  # option 2 Create a teacher
  def create_teacher
    puts 'Name: '
    name = gets.chomp.capitalize
    puts 'Age: '
    age = gets.chomp.to_i
    puts 'Specialization: '
    specialization = gets.chomp.capitalize
    @people << Teacher.new(specialization, age, name)
    puts 'Person created successfully'
  end
    # option 3 - Create a person
  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    option = gets.chomp
    if option == '1'
      create_student
    elsif option == '2'
      create_teacher
    else
      puts 'You entered a wrong input.'
    end
  end

  # option 4 - Create a book
  def create_book
    puts 'Title: '
    title = gets.chomp.capitalize
    puts 'Author: '
    author = gets.chomp.capitalize
    @books << Book.new(title, author)
    puts 'Book created successfully'
  end

  # option 5 - Create a rental
  def create_rental
    if @people.empty? || @books.empty?
      puts 'There are no books or people to create a rental'
      return
    end
    puts 'Please choose a book from the following list by number (not by id)'
    @books.each_with_index { |book, index| puts "[#{index}] Title: \"#{book.title}\", Author: \"#{book.author}\"" }
    book_no = gets.chomp.to_i

    puts 'Choos an owner from the following list by number (not by id)'
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_id = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp
    @rentals << Rental.new(date, @books[book_no], @people[person_id])
    puts 'Rental created successfully'
  end

  # option 6 - List all rentals for a person
  def rentals_by_id
    print 'Enter person ID: '
    id = gets.chomp.to_i

    rentals_found = @rentals.select { |rental| rental.person.id == id }
    if rentals_found.empty?
      puts 'No rentals found for the specified ID.'
    else
      puts 'This person has rented the following books:'
      rentals_found.each do |rental|
        puts "Date: #{rental.date}, Title: #{rental.book.title}, Author: #{rental.book.author}"
      end
    end
  end

  # option 7 - Exit
  def quit_app
    puts 'GoodBye!!'
    exit
  end

  # Choose option to execute
  def choose_option(option)
    case option
    when '1'
      list_all_books
    when '2'
      list_all_people
    when '3'
      create_person
    when '4'
      create_book
    when '5'
      create_rental
    when '6'
      rentals_by_id
    else
      puts 'You entered a wrong input, [choose input from 1-6]'
    end
  end
end  