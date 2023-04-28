require_relative './storage'

class SourceStorage < Storage
  @sources = []

  class << self
    attr_accessor :sources
  end

  def self.fetch
    sources = if File.exist?('./data/sources.json')
                JSON.parse(File.read('./data/sources.json'))
              else
                []
              end
    sources.map { |source| deserialize(source) }
  end

  def self.store(sources)
    sources.each do |source|
      @sources << serialize(source)
    end

    File.write('./data/sources.json', JSON.pretty_generate(@sources))
  end

  def self.serialize(source)
    # TODO: add items to serialization
    {
      id: source.id,
      name: source.name
    }
  end

  def self.deserialize(source)
    # TODO: add items to deserialization
    Source.new(source['name'], source['id'])
  end
end
