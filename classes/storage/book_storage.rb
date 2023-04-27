require_relative './storage'

class BooksStorage < Storage
  @books = []

  class << self
    attr_accessor :books
  end

  def self.fetch
    books = if File.exist?('./data/books.json')
              JSON.parse(File.read('./data/books.json'))
            else
              []
            end
    books.map { |book| deserialize(book) }
  end

  def self.store(books)
    books.each do |book|
      @books << serialize(book)
    end

    File.write('./data/books.json', JSON.pretty_generate(@books))
  end

  def self.serialize(book)
    {
      id: book.id,
      name: book.name,
      publisher: book.publisher,
      publish_date: book.publish_date,
      cover_state: book.cover_state
    }
  end

  def self.deserialize(book)
    Book.new(book['name'], book['publisher'], book['publish_date'], book['cover_state'], book['id'])
  end
end
