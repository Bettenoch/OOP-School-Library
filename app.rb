require './student'
require './teacher'
require './book'
require './preserve_data'

class App
  attr_reader :books, :person, :rentals

  def initialize
    @people = []
    @books = []
    @rentals = []
  end
  # welcome message

  def welcome
    puts '=============================='
    puts 'Welcome to Power School Library!!'
    puts '=============================='
  end

  def list_options
    puts 'Please choose an option by entering a number:'
    puts '=============================='
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  def list_all_books
    @books = read_data('./data/books.json')
    puts 'Oops! Book list is empty!' if @books.empty?
    @books.each { |book| puts "Title: \"#{book['title']}\", Author: #{book['author']}\" Rentals: #{book['rentals']}" }
  end

  def list_all_people
    @people = read_data('./data/people.json')
    puts 'Oops! No one has rented a book yet' if @people.empty?
    @people.each do |person|
      puts "Name: #{person['name']}, ID: #{person['id']}, Age: #{person['age']}, Rentals: #{person['rentals']}"
    end
  end

  # option 1 Create a student
  def create_student(name, age)
    puts 'Does he/she have parent permission? [Y/N]: '
    permission = gets.downcase == 'y'
    @people << Student.new(age, name, permission)
    write_data(@people, './data/people.json')
    puts 'Person created successfully'
  end

  # option 2 Create a teacher
  def create_teacher(name, age)
    puts 'Specialization: '
    specialization = gets.chomp.capitalize
    @people << Teacher.new(name, age, specialization)
    write_data(@people, './data/people.json')
    puts 'Person created successfully'
  end
  # option 3 - Create a person

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    option = gets.chomp
    puts 'Enter Name: '
    name = gets.chomp.capitalize
    puts 'Enter Age: '
    age = gets.to_i
    if option == '1'
      create_student(name, age)
    elsif option == '2'
      create_teacher(name, age)
    else
      puts 'You entered a wrong input.'
    end
  end

  # option 4 - Create a book
  def create_book
    puts 'Enter Title: '
    title = gets.chomp.capitalize
    puts 'Enter Author: '
    author = gets.chomp.capitalize
    @books << Book.new(title, author)
    write_data(@books, './data/books.json')
    puts 'Book created successfully'
  end

  # option 5 - Create a rental
  def create_rental
    if @people.empty? || @books.empty?
      puts 'There are no books or people to create a rental'
      return
    end
    @books = read_data('./data/books.json')
    puts 'Please choose a book from the following list by number (not by id)'
    @books.each_with_index { |book, index| puts "#{index}) Title: \"#{book['title']}\", Author: \"#{book['author']}\"" }

    book_no = gets.chomp.to_i

    @people = read_data('./data/people.json')
    puts 'Choose an owner from the following list by number (not by id)'
    @people.each_with_index do |person, index|
      puts "#{index}) Name: #{person['name']}, ID: #{person['id']}, Age: #{person['age']}"
    end
    person_id = gets.chomp.to_i

    print 'Enter Date:(YY/DD/MM) '
    date = gets.chomp
    @rentals << Rental.new(date, @books[book_no], @people[person_id])
    write_data(@rentals, './data/rentals.json')
    puts 'Rental created successfully'
  end

  # option 6 - List all rentals for a person
  def rentals_by_id
    @rentals = read_file('./data/rentals.json')
    puts '=================== PEOPLE ==================='
    list_all_people
    print 'Enter person ID: '
    id = gets.chomp.to_i

    puts '=================== Rentals ==================='
    @rentals.each do |rental|
      if rental['person']['id'] == id
        puts "Date: #{rental['date']}, Book: \"#{rental['book']['title']}\" by #{rental['book']['author']}"
      end
    end
  end

  # option 7 - Exit
  def quit_app
    puts '**********||**********||******'
    puts 'GoodBye!!'
    puts '**********||**********||******'
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
