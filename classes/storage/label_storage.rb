require_relative './storage'

class LabelsStorage < Storage
  @labels = []

  class << self
    attr_accessor :labels
  end

  def self.fetch
    labels = if File.exist?('./data/labels.json')
               JSON.parse(File.read('./data/labels.json'))
             else
               []
             end
    labels.map { |label| deserialize(label) }
  end

  def self.store(labels)
    labels.each do |label|
      @labels << serialize(label)
    end

    File.write('./data/labels.json', JSON.pretty_generate(@labels))
  end

  def self.serialize(label)
    {
      id: label.id,
      title: label.title,
      color: label.color
    }
  end

  def self.deserialize(label)
    Label.new(label['title'], label['color'], label['id'])
  end
end
