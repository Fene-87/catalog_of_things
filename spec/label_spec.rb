require 'spec_helper'

describe Label do
  before :each do
    @label = Label.new 'Gift', 'Green'
  end
  context '#new' do
    it 'takes four parameters and return a book object' do
      expect(@label).to be_an_instance_of Label
    end
  end
  context '#title' do
    it 'returns the correct book name' do
      expect(@label.title).to eql 'Gift'
    end
  end
  context '#color' do
    it 'returns the correct book publisher' do
      expect(@label.color).to eql 'Green'
    end
  end
end
