require './LocalStore/database_write'
require './LocalStore/database_read'
require_relative './classes/item'
require_relative './classes/music'
require_relative './classes/genre'
require_relative './classes/source'
require_relative './classes/movie'
require_relative './classes/storage/movie_storage'
require_relative './classes/storage/source_storage'
require './classes/storage/game_storage.rb'
require './classes/storage/author_storage.rb'

class App
  include ReadFromDatabase
  include WriteToDatabase

  def initialize
    @item = Item.new('2019-01-01')
    @genres = read_genre
    @music_albums = read_music_album
    @movies = []
    @sources = []
    @movies = MovieStorage.fetch
    @sources = SourceStorage.fetch
    @games = GameStorage.fetch
    @authors = AuthorStorage.fetch
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
    if @authors.empty?
      puts "There are no authors\n\n"
    else
      puts "\n\List of Authors:\n"
      @authors.each do |author|
        puts "#{author.first_name} #{author.last_name}\n"
      end
    end
    puts
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

    new_game = Game.new(game_name, multiplayer, last_played_date, publish_date)
    @games << new_game

    puts 'Who is the author of the game? (e.g. Stephen King.)'
    puts 'First Name: '
    author_first_name = gets.chomp

    puts 'Last Name: '
    author_last_name = gets.chomp

    author = @authors.find do |author_temp|
      author_temp.first_name == author_first_name && author_temp.last_name == author_last_name
    end
    return unless author.nil?

    author = Author.new(author_first_name, author_last_name)
    @authors << author

    new_game.add_author(author)
  end

  def quit
    MovieStorage.store(@movies)
    SourceStorage.store(@sources)
    GameStorage.store(@games)
    AuthorStorage.store(@authors)
  end

  def run
    puts welcome
    loop do
      list_options
      choice = gets.chomp

      case choice
      when '1'
        @item
      when '2'
        display_music_album(show_index: true)
      when '5'
        display_genre(show_index: false)
      when '10'
        puts 'On spotify? [Y/N]:  '
        spotify_value = gets.chomp.capitalize
        puts 'Publish Date: (YYYY-MM-DD)'
        publish_date_value = gets.chomp
        validate_music_album(spotify_value, publish_date_value)
      when '3'
        list_movies
      when '4'
        list_games
      when '7'
        list_authors
      when '8'
        list_sources
      when '11'
        add_movie
      when '12'
        add_game
      when '13', 'q', 'Q'
        quit
        break
      else
        puts 'Invalid input'
      end
    end
  end

  def create_genre(name)
    new_genre_obj = Genre.new(name)
    @genres.push(new_genre_obj)
    new_genre_vari = @genres.map do |new_genre|
      { name: new_genre.name,
        id: new_genre.id }
    end
    write_genre(new_genre_vari)
    puts 'Genre created successfully!.'
    new_genre_obj
  end

  def validate_music_album(spotify_value, publish_date_value)
    if spotify_value == 'Y'
      new_spotify_value = true
      create_music_album(new_spotify_value, publish_date_value)
    elsif spotify_value == 'N'
      new_spotify_value = false
      create_music_album(new_spotify_value, publish_date_value)
    else
      puts 'Invalid spotify value Input'
      run
    end
  end

  def create_music_album(on_spotify, publish_date)
    new_music_album_obj = MusicAlbum.new(on_spotify, publish_date)
    puts 'Do you want to create a new genre(Y) or select an existing genre(N)? [Input the option]:'
    new_genre_option_value = gets.chomp.capitalize
    if new_genre_option_value == 'Y'
      puts 'Enter genre name (eg Comedy)'
      genre_variabl = gets.chomp.downcase.capitalize
      expect_genre_object = create_genre(genre_variabl)

      push_an_album = {
        on_spotify: new_music_album_obj.on_spotify,
        publish_date: new_music_album_obj.publish_date,
        id: new_music_album_obj.id,
        archived: new_music_album_obj.can_be_archived?,
        genre: { id: expect_genre_object.id,
                 name: expect_genre_object.name }
      }

      new_music_album_vari = @music_albums.push(push_an_album)
      write_music_album(new_music_album_vari)
      puts 'Music Album created successfully!.'

    elsif new_genre_option_value == 'N'
      puts 'Select a genre from the following list by number (not ID please)'
      display_genre(show_index: true)
      genre_index_value = gets.chomp.to_i

      push_an_album = {
        on_spotify: new_music_album_obj.on_spotify,
        publish_date: new_music_album_obj.publish_date,
        id: new_music_album_obj.id,
        archived: new_music_album_obj.can_be_archived?,
        genre: { id: @genres[genre_index_value].id,
                 name: @genres[genre_index_value].name }
      }
      new_music_album_vari = @music_albums.push(push_an_album)
      write_music_album(new_music_album_vari)
      puts 'Music Album created successfully!.'

    else
      puts 'Invalid Input'
    end
    run
  end

  def display_genre(show_index: false)
    @genres = read_genre
    if @genres.empty?
      puts 'Genre list is empty: Create a genre'
      run
    elsif show_index
      @genres.each_with_index do |genre, index|
        puts "#{index}) #{genre.class} Name: #{genre.name}, ID: #{genre.id}"
      end
      puts 'Display genre with index successfully'
    else
      @genres.each { |genre| puts "#{genre.class} Name: #{genre.name}, ID: #{genre.id}" }
      puts 'Display genre without index successfully'
      run
    end
  end

  def display_music_album(show_index: false)
    @music_albums = read_music_album
    if @music_albums.empty?
      puts 'Music Album list is empty: Create an Album'
    elsif show_index
      @music_albums.each_with_index do |music_album, index|
        puts "#{index}) Publish Date: #{music_album['publish_date']} On Spotify: #{music_album['on_spotify']}, ID: #{music_album['id']}"
      end
      puts 'Display music album with index successfully'
    else
      @music_albums.each { |music_album| puts "Publish Date: #{music_album['publish_date']} On Spotify: #{music_album['on_spotify']}, ID: #{music_album['id']}" }
      puts 'Display music album without index successfully'
    end
    run
  end
end
