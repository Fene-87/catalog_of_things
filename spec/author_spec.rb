require 'rspec'
require_relative '../classes/author'
require_relative '../classes/item'
require_relative '../classes/game'

describe Author do
  context 'When instantiated' do
    author = Author.new('Liberty', 'Studios', 12)
    it 'Author should be instantiated successfully' do
      expect(author).to be_a Author
    end

    it 'Has correct first name' do
      expect(author.first_name).to eq 'Liberty'
    end
  end

  context 'It can properly add items' do
    it 'Can add game' do
      author = Author.new('Liberty', 'Studios', 12)
      author.add_item(Game.new('pokemon', 'y', '2023-04-26', '2010-01-24', 27))
      expect(author.items.first).to be_a Game
    end
  end
end
