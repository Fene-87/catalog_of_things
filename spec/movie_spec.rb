require 'spec_helper'

describe Movie do
  it 'can be archived if it is silent' do
    movie = Movie.new('Silent Movie', true, '2012-01-01')
    movie.move_to_archive
    expect(movie.archived).to be true
  end

  it 'can be archived if it is more than 10 years old' do
    movie = Movie.new('Old Movie', false, '1900-01-01')
    movie.move_to_archive
    expect(movie.archived).to be true
  end

  it 'can not be archived if it is less than 10 years old' do
    movie = Movie.new('New Movie', false, '2019-01-01')
    movie.move_to_archive
    expect(movie.archived).to be false
  end

  context 'can add properties' do
    # TODO: add tests for add_genre, add_author, add_source, add_label
    it 'can add source' do
      movie = Movie.new('New Movie', false, '2019-01-01')
      movie.add_source(Source.new('Netflix'))
      expect(movie.source).to be_a Source
    end

    it 'adds correct source' do
      movie = Movie.new('New Movie', false, '2019-01-01')
      movie.add_source(Source.new('Netflix'))
      expect(movie.source.name).to eq 'Netflix'
    end
  end
end
