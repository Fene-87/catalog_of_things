require_relative './storage'

class MusicAlbumStorage < Storage
  @music_albums = []

  class << self
    attr_accessor :music_albums
  end

  def self.fetch
    music_albums = if File.exist?('./data/music_albums.json')
                     JSON.parse(File.read('./data/music_albums.json'))
                   else
                     []
                   end
    music_albums.map { |music_album| deserialize(music_album) }
  end

  def self.store(music_albums)
    music_albums.each do |music_album|
      @music_albums << serialize(music_album)
    end

    File.write('./data/music_albums.json', JSON.pretty_generate(@music_albums))
  end

  def self.serialize(music_album)
    {
      id: music_album.id,
      name: music_album.name,
      on_spotify: music_album.on_spotify,
      publish_date: music_album.publish_date
    }
  end

  def self.deserialize(music_album)
    MusicAlbum.new(music_album['name'], music_album['on_spotify'], music_album['publish_date'], music_album['id'])
  end
end
