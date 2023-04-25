require_relative './item'

class Movie < Item
  def initialize(name, silent, publish_date)
    super(publish_date)
    @silent = silent
    @name = name
    @items = []
  end

  private

  def can_be_archived?
    # movie can be archived if parent method returns true
    # or if it is silent
    super || @silent
  end
end
