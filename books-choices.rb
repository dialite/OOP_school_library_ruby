require './book'

class BooksChoices
  attr_accessor :books

  def initialize
    @books = []
  end

  def create_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    book = Book.new(title, author)
    @books << book

    puts 'Book added successfully'
    sleep 0.75
  end

  def list_all_books
    puts 'There are no books yet! Kindly add books.' if @books.empty?

    @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
    sleep 0.75
  end

end