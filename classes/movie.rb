require_relative './item'

class Movie < Item
  attr_reader :name, :publish_date, :silent, :id

  def initialize(name, silent, publish_date, id = Random.rand(1..1000))
    super(publish_date)
    @silent = silent
    @name = name
    @items = []
    @id = id
  end

  private

  def can_be_archived?
    # movie can be archived if parent method returns true
    # or if it is silent
    super || @silent
  end
end
