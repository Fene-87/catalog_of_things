require 'spec_helper'

describe Source do
  it 'can be created' do
    source = Source.new('Netflix')
    expect(source).to be_a Source
  end

  it 'has a name' do
    source = Source.new('Netflix')
    expect(source.name).to eq 'Netflix'
  end

  context 'can add items' do
    it 'can add movie' do
      source = Source.new('Netflix')
      source.add_item(Movie.new('New Movie', false, '2019-01-01'))
      expect(source.items.first).to be_a Movie
    end

    it 'adds correct movie' do
      source = Source.new('Netflix')
      source.add_item(Movie.new('New Movie', false, '2019-01-01'))
      expect(source.items.first.name).to eq 'New Movie'
    end
  end
end
