require_relative '../book'

describe Book do
  context 'When providing book information' do
    book = Book.new('Lord of the Ring', 'Richard Benson')

    it 'create a book with title Lord of the Ring' do
      expect(book).to be_an_instance_of Book
    end

    it 'title off book should be Lord of the Ring' do
      expect(book.title).to eq 'Lord of the Ring'
    end

    it 'Author of book should be Richard Benson' do
      expect(book.author).to eq 'Richard Benson'
    end
  end
end