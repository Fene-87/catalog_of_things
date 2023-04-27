def list_options
  puts 'What would you like to do?'
  puts '1. List all books'
  puts '2. List all music albums'
  puts '3. List all movies'
  puts '4. List all games'
  puts '5. List all genres'
  puts '6. List all labels'
  puts '7. List all authors'
  puts '8. List all sources'
  puts '9. Add a new book'
  puts '10. Add a new music album'
  puts '11. Add a new movie'
  puts '12. Add a new game'
  puts '13. Exit'
end

def list_movies
  if @movies.empty?
    puts "There are no movies\n\n"
  else
    puts "\n\nMovies:\n"
    @movies.each do |movie|
      puts "#{movie.name} (#{movie.publish_date.year})\n"
    end
  end
  puts
end

def list_sources
  if @sources.empty?
    puts "There are no sources\n\n"
  else
    puts "\n\nSources:\n"
    @sources.each do |source|
      puts "#{source.name}\n"
    end
  end
  puts
end

def list_games
  if @games.empty?
    puts "There are no games\n\n"
  else
    puts "\n\nGames:\n"
    @games.each do |game|
      puts "#{game.name} #{game.multiplayer} #{game.last_played_at} (#{game.publish_date.year})\n"
    end
  end
  puts
end

def list_authors
  if @authors.empty?
    puts "There are no authors\n\n"
  else
    puts "\n\nList of Authors:\n"
    @authors.each do |author|
      puts "#{author.first_name} #{author.last_name}\n"
    end
  end
  puts
end

# list books

def list_books
  if @books.empty?
    puts "There are no books\n\n"
  else
    puts "\n\nBooks:\n"
    @books.each do |book|
      puts "Name: #{book.name} Publisher: #{book.publisher} Cover State: #{book.cover_state}\n"
    end
  end
  puts
end

# list labels

def list_labels
  if @labels.empty?
    puts "There are no labels\n\n"
  else
    puts "\n\nLabels:\n"
    @labels.each do |label|
      puts "Title: #{label.title} Color: #{label.color}\n"
    end
  end
  puts
end
