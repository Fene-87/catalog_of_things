require_relative 'item'

class Label
  attr_reader :id, :title, :color, :items
  
  def initialize(id, title, color)
    @id = id
    @title = title
    @color = color
    @items = []
  end
  
  def add_item(item)
    @items << item
    item.add_label(self)
  end
end
