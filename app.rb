class App
  def welcome
    'Welcome to the app'
  end

  def run
    # TODO: - add your code here
    puts welcome

    puts 'What would you like to do?'
    puts '1. Add a new item'
    puts '2. Archive an item'
    puts '3. Exit'

    input = gets.chomp

    case input
    when '1'
      add_item
    when '2'
      archive_item
    when '3'
      exit
    else
      puts 'Invalid input'
    end
  end
end
