require_relative '../rental'
require_relative '../book'

describe Rental do
  context 'When providing a book and a person' do
    person = Person.new 1, 15, 'Kennedy', true
    book = Book.new('Habits', 'James')
    rented = Rental.new('01-02-2022', book, person, 1)

    it 'Should create rental for person' do
      expect(person.rentals).to include(rented)
    end
  end
end
