require './LocalStore/database_write'
require './LocalStore/database_read'
require_relative './classes/item'
require_relative './classes/music'
require_relative './classes/genre'


class App
  include ReadFromDatabase
  include WriteToDatabase

  def initialize
    @item = Item.new('2019-01-01')
    @genres = read_genre
    @music_albums = read_music_album
  end

  def welcome
    'Welcome to the app'
  end

  def run
    # TODO: - add your code here
    puts welcome

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
    puts '13. Add a new genre'
    puts '14. Exit'

    input = gets.chomp

    case input
    when '1'
      @item
    when '2'
      display_music_album(show_index: true)
    when '5'
      display_genre(show_index: true)
    when '10'
      puts 'On spotify? [Y/N]:  '
      spotify_value = gets.chomp
      puts 'Publish Date: (YYYY-MM-DD)'
      publish_date_value = gets.chomp
      validate_music_album(spotify_value, publish_date_value)
    when '13'
      puts 'Enter genre name (eg Comedy)'
      genre_value = gets.chomp
      create_genre(genre_value)
    when '14'
      exit
    else
      puts 'Invalid input'
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
    run
  end

  def validate_music_album(spotify_value, _publish_date_value)
    if spotify_value == 'Y'
      new_spotify_value = true
      create_music_album(new_spotify_value, publish_date)
    elsif spotify_value == 'N'
      new_spotify_value = false
      create_music_album(new_spotify_value, publish_date)
    else
      puts 'Invalid spotify value Input'
      run
    end
  end

  def create_music_album(on_spotify, publish_date)
    new_music_album_obj = MusicAlbum.new(on_spotify, publish_date)
    @music_albums.push(new_music_album_obj)
    new_music_album_vari = @music_albums.map do |new_music_album|
      { on_spotify: new_music_album.on_spotify,
        publish_date: new_music_album.publish_date,
        id: new_music_album.id }
    end
    write_genre(new_music_album_vari)
    puts 'Music Album created successfully!.'
    run
  end

  def display_genre(show_index: false)
    @genres = read_genre
    if @genres.empty?
      puts 'Genre list is empty: Create a genre'
    elsif show_index
      @genres.each_with_index do |genre, index|
        puts "#{index}) #{genre.class} Name: #{genre.name}, ID: #{genre.id}"
        puts 'Display genre with index successfully'
      end
    else
      @genres.each { |genre| puts "#{genre.class}) Name: #{genre.name}, ID: #{genre.id}" }
      puts 'Display genre without index successfully'
    end
    run
  end

  def display_music_album(show_index: false)
    @music_albums = read_music_album
    if @music_albums.empty?
      puts 'Music Album list is empty: Create an Album'
    elsif show_index
      @music_albums.each_with_index do |music_album, index|
        puts "#{index}) Publish Date: #{music_album.publish_date} On Spotify: #{music_album.on_spotify}, ID: #{music_album.id}"
      end
      puts 'Display music album with index successfully'
    else
      @music_albums.each { |music_album| puts "Publish Date: #{music_album.publish_date} On Spotify: #{music_album.on_spotify}, ID: #{music_album.id}" }
      puts 'Display music album without index successfully'
    end
    run
  end
end
