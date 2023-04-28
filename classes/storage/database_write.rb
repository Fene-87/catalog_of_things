require 'json'

module WriteToDatabase
  def write_genre(genre)
    File.write('./data/genre.json', JSON.pretty_generate(genre))
  end

  def write_music_album(music_album)
    File.write('./data/music.json', JSON.pretty_generate(music_album))
  end
end
