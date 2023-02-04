require './app'

class MenuClass
  def initialize
    @app = App.new(self)
    puts 'Welcome to School Library!'
    exit
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
    select_option(user_input)
  end

  def select_option(user_input)
    menu_list = {
      '1' => :list_all_books,
      '2' => :list_all_people,
      '3' => :create_person,
      '4' => :create_book,
      '5' => :create_rental,
      '6' => :list_rentals_by_person_id,
      '7' => :exit
    }
    option = menu_list[user_input]
    if option.nil?
      puts 'Invalid number'
      display_menu
    else
      @app.send(option)
    end
  end
end

def main
  MenuClass.new
end

main
