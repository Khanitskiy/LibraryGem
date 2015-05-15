module LibraryGem
  class Author
    attr_accessor :name, :biography

    def initialize(options)
  	  @name        = options[:name]
  	  @biography   = options[:biography]
    end
  end
end