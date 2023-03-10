require_relative './app'
require_relative './storage'

class MenuClass
  def initialize
    @app = App.new(self)
    puts 'Welcome to School Library!'
    display_menu
  end

  def display_menu
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
    user_input = gets.chomp
    if user_input == '7'
      puts 'bye, thanks for using the app'
      Storage.save_data('books', @app.books_choices.books)
      Storage.save_data('people', @app.people_choices.people)
      Storage.save_data('rentals', @app.rentals_choices.rentals)
      exit(true)
    else
      @app.select_option(user_input)
    end
  end
end

def main
  MenuClass.new
end

main
