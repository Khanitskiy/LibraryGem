module LibraryGem
class Library

  require_relative 'book'
  require_relative 'order'
  require_relative 'reader'
  require_relative 'author'
  require_relative 'initialization_data'

  TOP_BOOKS = 3
  attr_reader :data, :books, :orders, :readers, :authors 
  
  def initialize

  	@data = InitializationData.new

	@books   = @data.read_books_from_file
	@orders  = @data.read_orders_from_file
	@readers = @data.read_readers_from_file
	@authors = @data.read_authors_from_file

  end

  def most_popular_book 
    @orders.inject(Hash.new(100)) { |hash, elem| hash[elem.book] += 1; hash}.max_by{|k,v| v}
  end

  def who_often_takes_book(book)
    @orders.inject(Hash.new(0)) { |hash, elem| hash[elem.reader] += 1 if elem.book == book; hash}.max_by{|k,v| v}[0]
  end

  def counter_orders_three_most_popular_books
    all_books = @orders.inject(Hash.new(0)) { |hash, elem| hash[elem.book] += 1; hash}
    result_book = Array.new
    TOP_BOOKS.times do
      result_book << all_books.max_by{|k,v| v}[0]
      all_books.delete_if {| key, value | key == result_book.last }
    end
    result_book_count = Array.new
    result_count = Array.new
    @orders.each { |x| result_book.each { |y| result_book_count << x if x.book == y }  }
    result_book_count.each { |x| result_count << x.reader }
    result_count.uniq!
    result_count.count
  end
  
end
end
