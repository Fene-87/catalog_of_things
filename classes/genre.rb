class Genre
  attr_accessor :id, :name, :items

  def initialize(name, id = Random.rand(1...1000))
    @id = id
    @name = name
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.genre = self
  end
end
