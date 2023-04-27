
require_relative '../classes/music'
require_relative '../classes/item'

describe MusicAlbum do
  context 'when initialized' do
    music = MusicAlbum.new(true, '2020-01-01')
    it 'music should initalize successfully' do
      expect(music.on_spotify).to eq(true)
    end
  end

  it '[can_be_archived?] should return true' do
    music = MusicAlbum.new(true, '2011-01-01')
    item = Item.new('2010-01-01')
    expect(music.can_be_archived?).to be(true)
  end
end
