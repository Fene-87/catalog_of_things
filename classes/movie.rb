require_relative './item'

class Movie < Item
  def initialize(silent, publish_date)
    super(publish_date)
    @silent = silent
    @items = []
  end

  def can_be_archived?
    # movie can be archived if parent method returns true
    # or if it is silent
    super || @silent
  end
end
