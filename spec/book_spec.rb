require_relative '../book'
require_relative '../student'
require_relative '../rental'
require 'json'


describe Book do
  context 'When providing book information' do
    book = Book.new('Lord of the Ring', 'Richard Benson')
    student = Student.new 11, 'class1', 17, 'John', 'n'
    rental = Rental.new '10-11-2020', book, student, 05

    it 'create a book with title Lord of the Ring' do
      expect(book).to be_an_instance_of Book
    end

    it 'title off book should be Lord of the Ring' do
      expect(book.title).to eq 'Lord of the Ring'
    end

    it 'Author of book should be Richard Benson' do
      expect(book.author).to eq 'Richard Benson'
    end

    it 'Add Rental should increase object length of rentals array by one' do
      book.add_rental(rental)
      expect(book.rentals.length).to eql 1
    end

    it 'Create json from Book object' do
      book_json = book.to_json
      expect(book_json).to eql '{"json_class":"Book","title":"Lord of the Ring","author":"Richard Benson"}'
    end
  
  end
end