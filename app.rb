require './book'
require './person'
require './rental'
require './student'
require './teacher'

class App
  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def list_books
    @books.each do |book|
      puts "Title: #{book.title} , Author: #{book.author}"
    end
  end

  def list_persons
    @people.each do |person|
      case person
      when Student
        puts "[Student] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      when Teacher
        puts "[Teacher] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp

    @books << Book.new(title, author)
    puts 'Book created successfully'
  end

  def create_person
    print 'Do you want to create a student (1) or teacher (2)? [Input the number] : '
    type = gets.chomp
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp

    case type
    when '1'
      print 'Has parent permission? [Y/N]: '
      parent_permission = gets.chomp == 'y'
      person = Student.new('classroom', age, name, parent_permission)
    when '2'
      print 'Specialization: '
      specialization = gets.chomp
      person = Teacher.new(age, specialization, name)
    end

    @people << person
    puts 'Person created successfully'
  end

  def list_rentals
    print 'ID of person: '
    person_id = gets.chomp.to_i

    puts 'Rentals:'
    @rentals.each do |rental|
      if rental.person.id == person_id
        puts "Date: #{rental.date}, Book '#{rental.book.title}' By #{rental.person.name} "
      end
    end
  end

  def create_rental
    puts 'Select abook from the following by number'
    @books.each_with_index { |book, index| puts " #{index})  Title: #{book.title} , Author: #{book.author}" }

    book_index = gets.chomp.to_i
    book = @books[book_index]

    puts 'select a person from the following list by number (not id)'
    @people.each_with_index do |person, index|
      case person
      when Student
        puts "#{index}) [Student] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      when Teacher
        puts "#{index}) [Teacher] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end

    person_index = gets.chomp.to_i
    person = @people[person_index]

    print 'Date (YYYY-MM-DD): '
    date = gets.chomp
    @rentals << Rental.new(date, book, person)
    puts 'Rental created.'
  end

  def run
    options = { '1' => :list_books,
                '2' => :list_persons,
                '3' => :create_person,
                '4' => :create_book,
                '5' => :create_rental,
                '6' => :list_rentals, '7' => :exit }

    puts ' '
    puts 'Please select one of the following options:'
    options.each { |key, value| puts "#{key} - #{value.to_s.capitalize.tr('_', ' ')}" }

    option = gets.chomp
    if options.key?(option)
      send(options[option])
    else
      puts 'Invalid option, please try again.'
    end

    run
  end
end

def main
  app = App.new
  app.run
end

main
