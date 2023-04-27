require './item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publisher, cover_state)
    super()
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    if super || cover_state == "bad"
      return true
    else
      return false
    end
  end
end
