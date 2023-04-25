require 'json'
require_relative '../classes/genre'
require_relative '../classes/music'

module ReadFromDatabase
  def read_genre
    if File.exist?('./data/genre.json')
      genres = File.open('./data/genre.json')
      data = genres.read
      parsed_genres = JSON.parse(data)
      genre_arr = parsed_genres.map do |dat|
        Genre.new(dat['name'], id= dat['id'])
      end
    else
      File.write('./data/genre.json', [])
      []
    end
  end

  def read_music_album
    if File.exist?('./data/music.json')
      music_albums = File.open('./data/music.json')
      data = music_albums.read
      parsed_music_albums = JSON.parse(data)
      music_albums_arr = parsed_music_albums.map do |dat|
        MusicAlbum.new(dat['on_spotify'], dat['publish_date'], id= dat['id'])
      end
    else
      File.write('./data/music.json', [])
      []
    end
  end
end
