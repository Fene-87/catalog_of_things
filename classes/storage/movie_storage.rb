require_relative './storage'

class MovieStorage < Storage
  @movies = []

  class << self
    attr_accessor :movies
  end

  def self.fetch
    movies = if File.exist?('./data/movies.json')
               JSON.parse(File.read('./data/movies.json'))
             else
               []
             end
    movies.map { |movie| deserialize(movie) }
  end

  def self.store(movies)
    movies.each do |movie|
      @movies << serialize(movie)
    end

    File.write('./data/movies.json', JSON.pretty_generate(@movies))
  end

  def self.serialize(movie)
    # TODO: add label, source, author and genre to serialization
    {
      id: movie.id,
      name: movie.name,
      publish_date: movie.publish_date,
      silent: movie.silent
    }
  end

  def self.deserialize(movie)
    # TODO: add label, source, author and genre to deserialization
    Movie.new(movie['name'], movie['silent'], movie['publish_date'], movie['id'])
  end
end
