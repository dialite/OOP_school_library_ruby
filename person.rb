require_relative './nameable'
require_relative './rental'

class Person < Nameable
  attr_accessor :name, :age, :rentals, :id

  # rubocop:disable Style/OptionalBooleanParameter
  def initialize(id, age, name = 'unknown', parent_permission = true)
    super()
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
    return unless @id.nil?

    @id = Random.rand(1..1000)
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

  def add_rental(rental)
    @rentals << rental unless @rentals.include?(rental)
  end
end
