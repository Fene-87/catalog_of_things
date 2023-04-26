require_relative './classes/source'
require_relative './classes/movie'
require_relative './classes/storage/movie_storage'
require_relative './classes/storage/source_storage'
require './classes/game.rb'

class App
  def initialize
    @movies = MovieStorage.fetch
    @sources = SourceStorage.fetch
    @games = []
    @authors = []
  end

  def welcome
    'Welcome to the app'
  end

  def list_options
    puts 'What would you like to do?'
    puts '1. List all books'
    puts '2. List all music albums'
    puts '3. List all movies'
    puts '4. List all games'
    puts '5. List all genres'
    puts '6. List all labels'
    puts '7. List all authors'
    puts '8. List all sources'
    puts '9. Add a new book'
    puts '10. Add a new music album'
    puts '11. Add a new movie'
    puts '12. Add a new game'
    puts '13. Exit'
  end

  def list_movies
    if @movies.empty?
      puts "There are no movies\n\n"
    else
      puts "\n\nMovies:\n"
      @movies.each do |movie|
        puts "#{movie.name} (#{movie.publish_date.year})\n"
      end
    end
    puts
  end

  def list_sources
    if @sources.empty?
      puts "There are no sources\n\n"
    else
      puts "\n\Sources:\n"
      @sources.each do |source|
        puts "#{source.name}\n"
      end
    end
    puts
  end

  def list_games
    if @games.empty?
      puts "There are no games\n\n"
    else
      puts "\n\nGames:\n"
      @games.each do |game|
        puts "#{game.name} #{game.multiplayer} #{game.last_played_at} (#{game.publish_date.year})\n"
      end
    end
    puts
  end

  def list_authors
  end

  def add_movie
    puts 'What is the name of the movie?'
    movie_name = gets.chomp

    puts 'Is the movie silent? (y/n)'
    silent = gets.chomp.downcase == 'y'

    puts 'What is the publish date? (YYYY-MM-DD)'
    publish_date = gets.chomp

    new_movie = Movie.new(movie_name, silent, publish_date)
    @movies << new_movie

    puts 'What is the source of the movie? (e.g. Online, From a friend, etc.)'
    source_name = gets.chomp

    # find the source with the given name, or create a new one
    source = @sources.find { |source_temp| source_temp.name == source_name }
    return unless source.nil?

    source = Source.new(source_name)
    @sources << source

    # add the movie to the source
    new_movie.add_source(source)
  end

  def add_game
    puts 'What is the name of the game?'
    game_name = gets.chomp

    puts 'Is the game multiplayer? (y/n)'
    multiplayer = gets.chomp.downcase

    puts 'What is the publish date? (YYYY-MM-DD)'
    publish_date = gets.chomp

    puts 'What is the last played at date? (YYYY-MM-DD)'
    last_played_date = gets.chomp

    new_game = Game.new(game_name, multiplayer,last_played_date, publish_date)
    @games << new_game
  end

  def quit
    MovieStorage.store(@movies)
    SourceStorage.store(@sources)
  end

  def run
    puts welcome
    loop do
      list_options
      choice = gets.chomp

      case choice
      when '3'
        list_movies
      when '4'
        list_games
      when '8'
        list_sources
      when '11'
        add_movie
      when '12'
        add_game
      when '13', 'q', 'Q'
        quit
        break
      end
    end
  end
end
