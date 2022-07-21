# Method for placing the 'marker' on 
  # Private method to check if the tile is valid
# class Player

class Game
  attr_accessor :game_finished, :tiles
  alias_method :game_finished?, :game_finished
  # Class variable for the board? def add_movie(movie) example?
  # Use hashes for each of the tiles?

  def initialize()
    @game_finished = false
    @tiles = {}
    for i in 1..9
      @tiles[i] = i
    end
  end

  def show_tiles()
    puts " #{@tiles[1]} | #{@tiles[2]} | #{@tiles[3]}"
    puts "---+---+---"
    puts " #{@tiles[4]} | #{@tiles[5]} | #{@tiles[6]}"
    puts "---+---+---"
    puts " #{@tiles[7]} | #{@tiles[8]} | #{@tiles[9]}"
  end

  def place_symbol(symbol, tile)
    if (@tiles[tile].is_a? Integer) && tile >= 1 && tile <= 9
      @tiles[tile] = symbol
    else
      puts "Sorry, invalid input."
    end
  end

  def check_game_status()

  end

end

game = Game.new()

puts "Welcome to Tic-Tac-Toe!"

while game.game_finished? == false
  game.show_tiles
  puts "Player one, where would you like to place your symbol [1-9]?"
  tile = gets.to_i
  game.place_symbol('x', tile)
  game.show_tiles
  # check game status, exit loop if finished
  puts "Player two, where would you like to place your symbol [1-9]?"
  tile = gets.to_i
  game.place_symbol('o', tile)
  # check game status again
end