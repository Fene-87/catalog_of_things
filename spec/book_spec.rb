require 'spec_helper'

describe Book do
  before :each do
    @book = Book.new 'The Kite Runner', 'Khalid Hosseini', '29-05-2003', 'Good'
  end
  context '#new' do
    it 'takes four parameters and return a book object' do
      expect(@book).to be_an_instance_of Book
    end
  end
  context '#name' do
    it 'returns the correct book name' do
      expect(@book.name).to eql 'The Kite Runner'
    end
  end
  context '#publisher' do
    it 'returns the correct book publisher' do
      expect(@book.publisher).to eql 'Khalid Hosseini'
    end
  end
  context '#publish_date' do
    it 'returns the correct book publish date' do
      expect(@book.publish_date).to eql '29-05-2003'
    end
  end
  context '#cover_state' do
    it 'returns the correct book cover state' do
      expect(@book.cover_state).to eql 'Good'
    end
  end
end