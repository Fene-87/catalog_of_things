require_relative './storage'

class GenreStorage < Storage
  @genres = []

  class << self
    attr_accessor :genres
  end

  def self.fetch
    genres = if File.exist?('./data/genres.json')
               JSON.parse(File.read('./data/genres.json'))
             else
               []
             end
    genres.map { |genre| deserialize(genre) }
  end

  def self.store(genres)
    genres.each do |genre|
      @genres << serialize(genre)
    end

    File.write('./data/genres.json', JSON.pretty_generate(@genres))
  end

  def self.serialize(genre)
    {
      id: genre.id,
      name: genre.name
    }
  end

  def self.deserialize(genre)
    Genre.new(genre['name'], genre['id'])
  end
end
