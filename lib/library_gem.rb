require "library_gem/version"
require_relative "files/library"
require_relative "files/save_data"

module LibraryGem
  library = Library.new
  save    = SaveData.new

  arg = Array.new
  ARGV.each do |a|
    arg << a
  end

  exp = arg[0]

  case exp
  when 'add_book'
    library.books << Book.new(title: arg[1], author: arg[2])
    save.save_book(library.books)
    puts "You are add new book"
  when 'add_order'
    library.orders << Order.new(book: arg[1], reader: arg[2], date: arg[3])
    save.save_order(library.orders)
    puts "You are add new order"
  when 'add_reader'
    library.orders << Reader.new(name: arg[1], email: arg[2], city: arg[3], street: arg[4], house: i[5])
    save.save_order(library.readers)
    puts "You are add new reader"
  when 'add_author'
    library.orders << Author.new(name: arg[1], biography: arg[2])
    save.save_order(library.authors)
    puts "You are add new author"
  when 'most_popular_book'
    p library.most_popular_book 
  when 'who_often_takes_book'
    puts library.who_often_takes_book(arg[1])
  when 'counter_orders_three_most_popular_books'
    puts library.counter_orders_three_most_popular_books
  else
    puts 'undefined comand!!!'
  end
end