require_relative './nameable'
require_relative './rental'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id, :rentals

  # rubocop:disable Style/OptionalBooleanParameter
  def initialize(age, name = 'unknown', parent_permission = true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end
  # rubocop:enable Style/OptionalBooleanParameter

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end

  public

  def can_use_services?
    of_age? || @parent_permission
  end

  def add_rental(date, book)
    Rental.new(date, book, self)
  end
end
