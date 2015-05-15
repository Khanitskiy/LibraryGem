class InitializationData

  DATA = 'data'
  attr_reader :book_items, :order_items, :reader_items, :author_items

  def initialize
  	@book_items   = Array.new
  	@order_items  = Array.new
  	@reader_items = Array.new
  	@author_items = Array.new

  end
  
  def read_books_from_file
    return unless File.exists?("#{DATA}/books.txt")  
    item_fields = File.readlines("#{DATA}/books.txt")
    item_fields.map! { |i| i.chomp } 
    item_fields.map! { |i| i.split(":")}
    item_fields.each { |i| @book_items << Book.new(title: i[0], author: i[1])}
    @book_items.uniq!
    return @book_items
  end

  def read_orders_from_file
    return unless File.exists?("#{DATA}/orders.txt")  
    item_fields = File.readlines("#{DATA}/orders.txt")
    item_fields.map! { |i| i.chomp }
    item_fields.map! { |i| i.split(":")}
    item_fields.each { |i| @order_items << Order.new(book: i[0], reader: i[1], date: i[2])}
    @order_items.uniq!
    return @order_items
  end

  def read_readers_from_file
    return unless File.exists?("#{DATA}/readers.txt")  
    item_fields = File.readlines("#{DATA}/readers.txt")
    item_fields.map! { |i| i.chomp }
    item_fields.map! { |i| i.split(":")}
    item_fields.each { |i| @reader_items << Reader.new(name: i[0], email: i[1], city: i[2], street: i[3], house: i[4])}
    @reader_items.uniq!
    return @reader_items
  end

  def read_authors_from_file
    return unless File.exists?("#{DATA}/authors.txt")  
    item_fields = File.readlines("#{DATA}/authors.txt")
    item_fields.map! { |i| i.chomp }
    item_fields.map! { |i| i.split(":")}
    item_fields.each { |i| @author_items << Author.new(name: i[0], biography: i[1])}
    @author_items.uniq!
    return @author_items
  end

end