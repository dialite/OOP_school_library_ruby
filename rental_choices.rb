require_relative './rental'

class RentalChoices
  attr_accessor :rentals

  def initialize(books_choices, people_choices)
    @rentals = []
    @books_choices = books_choices
    @people_choices = people_choices
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books_choices.list_all_books
    book_id = gets.chomp.to_i

    puts 'Select a person from the following list by number (not id)'
    @people_choices.list_all_people

    person_id = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp.to_s

    @rentals.push(Rental.new(date, @books_choices.books[book_id], @people_choices.people[person_id]))

    puts 'Rental created successfully'
    sleep 0.75
  end

  def list_rentals_by_person_id
    print 'ID of person: '
    id = gets.chomp.to_i

    puts 'Rentals:'
    @rentals.each do |rental|
      puts "Date: #{rental.date}, Book '#{rental.book.title}' by #{rental.book.author}" if rental.person.id == id
    end
    sleep 0.75
  end
end
