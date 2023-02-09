class Rental
  attr_accessor :date, :book, :person, :id

  def initialize(date, book, person, id)
    @date = date
    @id = id
    @book = book
    book.rentals.push(self)
    @person = person
    person.rentals << self
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'date' => @date,
      'book' => @book,
      'person' => @person,
      'id' => @id
    }.to_json(*args)
  end

  def self.json_create(object)
    new(object['date'], object['book'], object['person'], object['id'])
  end
end
