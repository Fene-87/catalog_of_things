require_relative './list_data'
require_relative './classes/item'
require_relative './classes/music'
require_relative './classes/genre'
require_relative './classes/source'
require_relative './classes/movie'
require_relative './classes/storage/movie_storage'
require_relative './classes/storage/source_storage'
require_relative './classes/game'
require_relative './classes/author'
require_relative './classes/storage/game_storage'
require_relative './classes/storage/author_storage'
require_relative './classes/storage/book_storage'
require_relative './classes/storage/label_storage'
require_relative './classes/storage/music_storage'
require_relative './classes/storage/genre_storage'
require_relative './classes/book'
require_relative './classes/label'

class App
  def initialize
    @item = Item.new('2019-01-01')
    @genres = GenreStorage.fetch
    @music_albums = MusicAlbumStorage.fetch
    @movies = MovieStorage.fetch
    @sources = SourceStorage.fetch
    @games = GameStorage.fetch
    @authors = AuthorStorage.fetch
    @books = BooksStorage.fetch
    @labels = LabelsStorage.fetch
  end

  def welcome
    'Welcome to the app'
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

  # add a book

  def add_book
    puts 'What is the name of the book?'
    book_name = gets.chomp

    puts 'Who is the publisher of the book?'
    book_publisher_name = gets.chomp

    puts 'What is the date of publish of the book?'
    book_publish_date = gets.chomp

    puts 'What is the cover state of the book? (Good/Bad)'
    book_cover_state = gets.chomp

    new_book = Book.new(book_name, book_publisher_name, book_publish_date, book_cover_state)
    @books << new_book

    puts 'What is the label of the book? (e.g. Gift, New)'
    label_name = gets.chomp

    puts 'What is the color of the label of the book?'
    label_color = gets.chomp

    label = Label.new(label_name, label_color)
    @labels << label

    new_book.add_label(label)
  end

  def add_music_album
    puts 'What is the name of the album?'
    album_name = gets.chomp

    puts 'What is the publish date? (YYYY-MM-DD)'
    publish_date = gets.chomp

    puts 'Is album on Spotify? (y/n)'
    on_spotify = gets.chomp.downcase == 'y'

    new_music_album = MusicAlbum.new(album_name, on_spotify, publish_date)
    @music_albums << new_music_album

    puts 'What is the genre of the album?'
    genre_name = gets.chomp

    genre = @genres.find { |genre_temp| genre_temp.name == genre_name }
    return unless genre.nil?

    genre = Genre.new(genre_name)
    @genres << genre

    new_music_album.add_genre(genre)
  end

  def quit
    MovieStorage.store(@movies)
    SourceStorage.store(@sources)
    GameStorage.store(@games)
    AuthorStorage.store(@authors)
    BooksStorage.store(@books)
    LabelsStorage.store(@labels)
    MusicAlbumStorage.store(@music_albums)
    GenreStorage.store(@genres)
  end

  def run
    puts welcome
    loop do
      list_options
      choice = gets.chomp

      case choice
      when '1'
        list_books
      when '2'
        display_music_album(show_index: true)
      when '3'
        list_movies
      when '4'
        list_games
      when '5'
        display_genre(show_index: false)
      when '6'
        list_labels
      when '7'
        list_authors
      when '8'
        list_sources
      when '9'
        add_book
      when '10'
        add_music_album
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
end
