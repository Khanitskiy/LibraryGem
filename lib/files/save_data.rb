class SaveData
  
  DATA = 'data'

  def save_book(book)
    File.open("#{DATA}/books.txt", "w") do |f|
      book.each { |i| f.puts "#{i.title}:#{i.author}" }
    end
  end
  
  def save_order(order)
    File.open("#{DATA}/orders.txt", "w") do |f|
      order.each { |i| f.puts "#{i.book}:#{i.reader}:#{i.date}" }
    end
  end

  def save_reader(reader)
    File.open("#{DATA}/readers.txt", "w") do |f|
      reader.each { |i| f.puts "#{i.name}:#{i.email}:#{i.city}:#{i.street}:#{i.house}" }
    end
  end

  def save_author(author)
    File.open("#{DATA}/authors.txt", "w") do |f|
      author.each { |i| f.puts "#{i.name}:#{i.biography}" }
    end
  end

end