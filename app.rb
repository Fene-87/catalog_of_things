require_relative './classes/item'

class App
  def initialize
    @item = Item.new('2019-01-01')
  end

  def welcome
    'Welcome to the app'
  end

  def run
    # TODO: - add your code here
    puts welcome

    puts 'What would you like to do?'
    puts '1. Add a new genre'
    puts '2. Archive an item'
    puts '3. Exit'

    input = gets.chomp

    case input
    when '1'
      @item.add_genre('genre')
    when '2'
      @item.move_to_archive
    when '3'
      exit
    else
      puts 'Invalid input'
    end
  end
end
