require_relative './books_choices'
require_relative './people_choices'
require_relative './rental_choices'
require_relative './classroom'

class App
  def initialize(menu)
    @menu = menu
    @books_choices = BooksChoices.new
    @people_choices = PeopleChoices.new
    @rental_choices = RentalChoices.new(@books_choices, @people_choices)
    @class = Classroom.new('Grade 9')
  end

  def select_option(user_input)
    case user_input
    when '1'
      @books_choices.list_all_books
    when '2'
      @people_choices.list_all_people
    when '3'
      @people_choices.create_person
    when '4'
      @books_choices.create_book
    when '5'
      @rental_choices.create_rental
    when '6'
      @rental_choices.list_rentals_by_person_id
    else
      puts 'Invalid option'
    end
    @menu.display_menu
  end
end
