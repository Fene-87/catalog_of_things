class Book
    attr_accessor :publisher, :cover_state
  
    def initialize(publisher, cover_state)
      @publisher = publisher
      @cover_state = cover_state
    end
  
    def can_be_archived?
      if @cover_state == "torn" || @cover_state == "worn"
        return false
      else
        return true
      end
    end
end
  