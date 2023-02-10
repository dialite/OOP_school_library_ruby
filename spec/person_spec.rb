require_relative '../person'
require_relative '../book'
require_relative '../rental'
require_relative '../student'

describe Person do
  before :each do
    @person = Person.new 1, 19, 'Kennedy', true
    @person1 = Person.new 3, 15, 'Thompson', false
    @student = Student.new 10, 22, 'grade 5', 'James Brown', true
    @book = Book.new('Lord of the Ring', 'Richard Benson')
    @rental = Rental.new '10-11-2020', @book, @student, 21
  end
  context 'When creating person' do
    it 'create a person information' do
      expect(@person).to be_an_instance_of Person
    end

    it 'can_use_services when parent permission == true' do
      expect(@person.can_use_services?).to eql true
    end

    it 'When parent permission is false and below age' do
      expect(@person1.can_use_services?).to eql false
    end

    it "Name should be 'Kennedy'" do
      expect(@person.name).to eql 'Kennedy'
    end

    it 'Add Rental should add object into rentals array by a length of one' do
      @person.add_rental(@rental)
      expect(@person.rentals.length).to eql 1
    end
  end
end
