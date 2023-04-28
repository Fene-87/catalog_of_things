require_relative 'item'
class MusicAlbum < Item
  attr_accessor :name, :id, :on_spotify, :publish_date

  def initialize(name, on_spotify, publish_date, id = Random.rand(1...1000))
    super('2019-01-01')
    @name = name
    @id = id
    @on_spotify = on_spotify
    @publish_date = Date.parse(publish_date)
  end

  def can_be_archived?
    super == true && @on_spotify == true
  end
end
