require_relative '../classes/genre'
require_relative '../classes/item'


describe Genre do
  context 'when initialized' do
    genre = Genre.new('Afrobeat', 10)
    it 'has a name' do
      expect(genre.name).to eq('Afrobeat')
    end

    it 'has a id' do
      expect(genre.id).to eq(10)
    end
  end

  context 'when adding to item' do
    genre = Genre.new('Afrobeat', 10)
    item = Item.new('2019-01-01')
    items = []
    genre.add_item(item)
    it 'has items' do
      expect(genre.items).not_to be_empty
    end

    it 'has the correct item' do
      expect(genre.items[0]).to eq(item)
    end
  end
end
